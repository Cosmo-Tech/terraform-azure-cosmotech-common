locals {
  cluster_name   = var.cluster_name != "" ? var.cluster_name : "${var.dns_record}${random_string.cluster_id.result}"
  resource_group = var.resource_group != "" ? var.resource_group : var.dns_record
}

resource "random_string" "cluster_id" {
  length  = 6
  special = false
  upper   = false
}