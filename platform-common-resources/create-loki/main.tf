terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

locals {
  values_loki = {
    "MONITORING_NAMESPACE"             = var.monitoring_namespace
    "LOKI_RETENTION_PERIOD"            = var.loki_retention_period
    "LOKI_PERSISTENCE_MEMORY"          = var.loki_persistence_memory
    "LOKI_MAX_ENTRIES_LIMIT_PER_QUERY" = var.loki_max_entries_limet_per_query
    "NAMESPACE"                        = var.namespace
  }
}

resource "helm_release" "loki" {
  name       = var.loki_release_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  namespace  = var.monitoring_namespace
  values = [
    templatefile("${path.module}/values.yaml", local.values_loki)
  ]
}
