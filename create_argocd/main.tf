locals {
  values_argocd = {
    "REPLICAS"        = var.replicas
    "NAMESPACE"       = var.namespace
    "CREATE_INGRESS"  = var.create_ingress
    "ARGOCD_DNS_NAME" = var.argocd_dns_name
  }
  instance_name = var.helm_release_name
}

resource "kubernetes_namespace" "argocd_namespace" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "argocd" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.helm_chart_version
  namespace  = var.namespace

  reuse_values = true
  timeout      = 600

  values = [
    templatefile("${path.module}/values.yaml", local.values_argocd)
  ]
}

# RBAC
resource "kubectl_manifest" "argocd_setup_serviceaccount" {
  validate_schema = false
  yaml_body = templatefile("${path.module}/argocd-setup-serviceaccount.yaml.tpl",
    local.values_argocd
  )
}

resource "kubectl_manifest" "argocd_setup_role" {
  validate_schema = false
  yaml_body = templatefile("${path.module}/argocd-setup-role.yaml.tpl",
    local.values_argocd
  )
}

resource "kubectl_manifest" "argocd_setup_rolebinding" {
  validate_schema = false
  yaml_body = templatefile("${path.module}/argocd-setup-rolebinding.yaml.tpl",
    local.values_argocd
  )
}

# ------------- GET ARGOCD PASSWORD ------------ #

resource "kubernetes_config_map" "get_password_script" {
  metadata {
    name      = "get-password-script"
    namespace = var.namespace
  }

  data = {
    "get-password.sh" = file("${path.module}/get-password.sh")
  }
}

resource "kubernetes_job" "get_argocd_password" {
  metadata {
    name      = "get-argocd-password-job"
    namespace = var.namespace
  }

  spec {
    template {
      metadata {
        name = "get-argocd-password-job"
      }

      spec {
        restart_policy       = "OnFailure"
        service_account_name = "argocd-setup"
        container {
          name    = "get-password"
          image   = "bitnami/kubectl:latest"
          command = ["/bin/sh", "/scripts/get-password.sh", var.namespace]

          volume_mount {
            name       = "scripts"
            mount_path = "/scripts/get-password.sh"
            sub_path   = "get-password.sh"
          }
        }

        volume {
          name = "scripts"

          config_map {
            name = kubernetes_config_map.get_password_script.metadata[0].name
          }
        }
      }
    }
  }

  depends_on = [helm_release.argocd]
}

# ------------- CONFIGURE ARGOCD ------------ #

resource "kubernetes_config_map" "argocd_script" {
  metadata {
    name      = "argocd-setup-script"
    namespace = var.namespace
  }

  data = {
    "setup.sh" = file("${path.module}/argocd-setup.sh")
  }
  depends_on = [helm_release.argocd]
}

resource "kubernetes_job" "argocd_setup" {
  metadata {
    name      = "argocd-setup-job"
    namespace = var.namespace
  }

  spec {
    template {
      metadata {
        name = "argocd-setup-job"
      }

      spec {
        restart_policy       = "OnFailure"
        service_account_name = "argocd-setup"
        container {
          name    = "setup-argocd"
          image   = "argoproj/argocd:${var.argocd_setup_job_image_version}"
          command = ["/bin/sh", "/scripts/setup.sh", var.namespace, var.argocd_project, join(",", var.argocd_repositories), var.argocd_repository_username, var.argocd_repository_access_token]

          volume_mount {
            name       = "scripts"
            mount_path = "/scripts/setup.sh"
            sub_path   = "setup.sh"
          }
          volume_mount {
            name       = "argocd-initial-admin-secret"
            mount_path = "/etc/argocd-initial-admin-secret"
            read_only  = true
          }
        }

        volume {
          name = "scripts"

          config_map {
            name = kubernetes_config_map.argocd_script.metadata[0].name
          }
        }

        volume {
          name = "argocd-initial-admin-secret"

          secret {
            secret_name = "argocd-initial-admin-secret"
          }
        }
      }
    }
  }

  depends_on = [
    kubernetes_job.get_argocd_password,
    helm_release.argocd,
    kubernetes_config_map.argocd_script,
    kubectl_manifest.argocd_setup_role,
    kubectl_manifest.argocd_setup_rolebinding,
    kubectl_manifest.argocd_setup_serviceaccount
  ]
}
