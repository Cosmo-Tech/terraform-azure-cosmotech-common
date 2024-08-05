terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
  }
}

locals {
  values_vault = {
    "VAULT_REPLICAS"        = var.vault_replicas
    "NAMESPACE"             = var.namespace
#     "VAULT_INGRESS_ENABLED" = var.vault_ingress_enabled
#     "VAULT_DNS_NAME"        = var.vault_dns_name
#     "TLS_SECRET_NAME"       = local.tls_secret_name
    }
  instance_name = "${var.helm_release_name}-${var.namespace}"
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
}

# To unseal
resource "null_resource" "vault_unseal" {
  depends_on = [helm_release.vault]

  provisioner "local-exec" {
    command = "sh ${path.module}/unseal.sh ${var.namespace} ${var.vault_secret_name} ${var.vault_replicas}"
  }
}
