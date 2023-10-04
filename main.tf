locals {
  cluster_name   = var.cluster_name != "" ? var.cluster_name : "${var.dns_record}${random_string.cluster_id.result}"
  resource_group = var.resource_group != "" ? var.resource_group : var.dns_record
  # kube_config    = module.cosmotech-prerequisites.out_aks_phoenix_config
}

resource "random_string" "cluster_id" {
  length  = 6
  special = false
  upper   = false
}