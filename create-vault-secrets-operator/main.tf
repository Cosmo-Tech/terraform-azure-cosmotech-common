locals {
  values_vault_secrets_operator = {
    "NAMESPACE"             = var.namespace
    "REPLICAS"              = var.replicas
    "ALLOWED_NAMESPACES"    = jsonencode(concat(["vault", "default"], var.allowed_namespaces))
    "VAULT_ADDR"            = var.vault_address
  }
  instance_name = "${var.helm_release_name}"
}

resource "kubernetes_namespace" "vault_secrets_operator" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "vault_secrets_operator" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.helm_chart_version
  namespace  = var.namespace

  values = [
    templatefile("${path.module}/values.yaml", local.values_vault_secrets_operator)
  ]

  set {
    name  = "vault.address"
    value = var.vault_address
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = "vault-secrets-operator"
  }

  depends_on = [
    kubernetes_namespace.vault_secrets_operator,
    kubernetes_service_account.vault_secrets_operator,
    kubernetes_cluster_role_binding.vault_secrets_operator,
    kubernetes_role_binding.vault_secrets_operator_auth_delegator
  ]
}

resource "kubernetes_service_account" "vault_secrets_operator" {
  metadata {
    name      = "vault-secrets-operator"
    namespace = var.namespace
  }
}

resource "kubernetes_cluster_role_binding" "vault_secrets_operator" {
  metadata {
    name = "vault-secrets-operator-rolebinding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "vault-secrets-operator-role"
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.vault_secrets_operator.metadata[0].name
    namespace = var.namespace
  }
}

resource "kubernetes_role_binding" "vault_secrets_operator_auth_delegator" {
  metadata {
    name      = "vault-secrets-operator-auth-delegator"
    namespace = var.namespace
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "system:auth-delegator"
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.vault_secrets_operator.metadata[0].name
    namespace = var.namespace
  }
}

resource "kubectl_manifest" "vault_connection" {
  yaml_body = templatefile("${path.module}/templates/vault-connection.yaml.tpl", {
    namespace     = var.namespace
    vault_address = var.vault_address
  })

  depends_on = [helm_release.vault_secrets_operator]
}

resource "kubectl_manifest" "platform_vault_secret" {
  yaml_body = templatefile("${path.module}/templates/platform-vault-secret.yaml.tpl", {
    namespace = var.namespace
  })

  depends_on = [helm_release.vault_secrets_operator, kubectl_manifest.operator_vault_auth, kubernetes_job.vault_config, kubectl_manifest.vault_connection  ]
}

resource "kubectl_manifest" "workspace_vault_secret" {
  yaml_body = templatefile("${path.module}/templates/workspace-vault-secret.yaml.tpl", {
    namespace = var.namespace
  })

  depends_on = [helm_release.vault_secrets_operator, kubectl_manifest.operator_vault_auth, kubernetes_job.vault_config, kubectl_manifest.vault_connection ]
}

resource "kubectl_manifest" "namespace_vault_secret" {
  for_each = toset(var.allowed_namespaces)

  yaml_body = templatefile("${path.module}/templates/vault-static-secret.yaml.tpl", {
    namespace = each.key
  })

  depends_on = [helm_release.vault_secrets_operator, kubectl_manifest.namespace_vault_auth, kubectl_manifest.namespace_vault_connection ]
}

resource "kubernetes_role" "secret_access" {
  for_each = toset(var.allowed_namespaces)

  metadata {
    name      = "${each.key}-role"
    namespace = each.key
  }

  rule {
    api_groups = ["secrets.hashicorp.com"]
    resources  = ["vaultstaticsecrets"]
    resource_names = ["${each.key}-secrets", "platform-secret", "workspace-secret"]
    verbs      = ["get", "list", "watch"]
  }

  rule {
    api_groups = [""]
    resources  = ["secrets"]
    resource_names = ["${each.key}-secrets", "platform-secret", "workspace-secret"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_role_binding" "secret_access" {
  for_each = toset(var.allowed_namespaces)

  metadata {
    name      = "secret-access-binding-${each.key}"
    namespace = each.key
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.secret_access[each.key].metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = each.key
  }
}

resource "kubectl_manifest" "operator_vault_auth" {
  yaml_body = templatefile("${path.module}/templates/vault-secrets-operator-auth.yaml.tpl", {
    namespace = var.namespace
  })

  depends_on = [kubectl_manifest.vault_connection]
}

resource "kubectl_manifest" "namespace_vault_connection" {
  for_each = toset(var.allowed_namespaces)

  yaml_body = templatefile("${path.module}/templates/vault-connection.yaml.tpl", {
    namespace     = each.key
    vault_address = var.vault_address
  })

  depends_on = [helm_release.vault_secrets_operator]
}

resource "kubectl_manifest" "namespace_vault_auth" {
  for_each = toset(var.allowed_namespaces)

  yaml_body = templatefile("${path.module}/templates/vault-auth.yaml.tpl", {
    namespace = each.key
  })

  depends_on = [kubectl_manifest.namespace_vault_connection]
}

resource "kubernetes_config_map" "vault_config_script" {
  metadata {
    name      = "vault-config-script"
    namespace = var.vault_namespace
  }

  data = {
    "configure-vault.sh"               = templatefile("${path.module}/templates/configure-vault.sh.tpl", {
      allowed_namespaces               = var.allowed_namespaces
      VAULT_NAMESPACE                  = var.vault_namespace
      VAULT_SECRETS_OPERATOR_NAMESPACE = var.namespace
    })
  }
}

resource "kubernetes_job" "vault_config" {
  metadata {
    name      = "vault-config-job"
    namespace = var.vault_namespace
  }

  spec {
    template {
      metadata {
        name = "vault-config"
      }

      spec {
        service_account_name = "vault"
        container {
          name    = "vault-config"
          image   = "bitnami/kubectl:latest"
          command = ["/bin/bash", "-c", "bash /scripts/configure-vault.sh"]

          env {
            name  = "VAULT_ADDR"
            value = var.vault_address
          }

          env {
            name  = "VAULT_NAMESPACE"
            value = var.vault_namespace
          }

          volume_mount {
            name       = "config"
            mount_path = "/scripts"
          }
        }

        volume {
          name = "config"
          config_map {
            name = kubernetes_config_map.vault_config_script.metadata[0].name
          }
        }

        restart_policy = "OnFailure"
      }
    }

    backoff_limit = 4
  }

  wait_for_completion = true

  depends_on = [
    helm_release.vault_secrets_operator,
    kubernetes_config_map.vault_config_script,
    kubectl_manifest.operator_vault_auth
  ]
}