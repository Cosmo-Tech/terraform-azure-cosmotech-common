locals {
  values_vault = {
    "REPLICAS"              = var.vault_replicas
    "NAMESPACE"             = var.namespace
    "VAULT_INGRESS_ENABLED" = var.vault_ingress_enabled
    "VAULT_DNS_NAME"        = var.vault_dns_name
    #     "TLS_SECRET_NAME"       = local.tls_secret_name
  }
  instance_name = var.helm_release_name
  # tls_secret_name = "${var.tls_secret_name}-${var.namespace}"
}

resource "kubernetes_namespace" "vault_namespace" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "vault" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.helm_chart_version
  namespace  = var.namespace

  reuse_values = true
  timeout      = 600

  values = [
    templatefile("${path.module}/values.yaml", local.values_vault)
  ]

  depends_on = [
    kubernetes_namespace.vault_namespace
  ]
}

resource "kubectl_manifest" "vault_unseal_role" {
  validate_schema = false
  yaml_body = templatefile("${path.module}/vault-unseal-role.yaml.tpl",
    local.values_vault
  )
}

resource "kubectl_manifest" "vault_unseal_rolebinding" {
  validate_schema = false
  yaml_body = templatefile("${path.module}/vault-unseal-rolebinding.yaml.tpl",
    local.values_vault
  )
}

# Configmap
resource "kubernetes_config_map" "vault_unseal_script" {
  metadata {
    name      = "vault-unseal-script"
    namespace = var.namespace
  }

  data = {
    "unseal.sh" = file("${path.module}/unseal.sh")
  }
  depends_on = [helm_release.vault]
}

#Job for script
resource "kubernetes_job" "vault_unseal" {
  metadata {
    name      = "vault-unseal"
    namespace = var.namespace
  }
  wait_for_completion = false
  spec {
    template {
      metadata {
        name = "vault-unseal"
      }

      spec {
        restart_policy       = "OnFailure"
        service_account_name = "vault"
        container {
          name    = "vault-unseal"
          image   = "bitnami/kubectl:latest"
          command = ["/bin/bash", "/scripts/unseal.sh", var.namespace, var.vault_secret_name, var.vault_replicas]

          volume_mount {
            name       = "script-volume"
            mount_path = "/scripts/unseal.sh"
            sub_path   = "unseal.sh"
          }
        }

        volume {
          name = "script-volume"

          config_map {
            name = kubernetes_config_map.vault_unseal_script.metadata[0].name

            items {
              key  = "unseal.sh"
              path = "unseal.sh"
            }
          }
        }
      }
    }
  }
  depends_on = [
    helm_release.vault,
    kubernetes_config_map.vault_unseal_script,
    kubectl_manifest.vault_unseal_role,
    kubectl_manifest.vault_unseal_rolebinding
    # kubectl_manifest.vault_unseal_serviceaccount
  ]
}
