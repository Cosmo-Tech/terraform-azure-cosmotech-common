terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
  }
}

locals {
  values_vault_secrets_operator = {
    "NAMESPACE"             = var.namespace
    }
  instance_name = "${var.helm_release_name}"
}

resource "kubernetes_namespace" "vault_secrets_operator_namespace" {
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

  reuse_values = true
  timeout      = 600

  values = [
    templatefile("${path.module}/values.yaml", local.values_vault_secrets_operator)
  ]
}