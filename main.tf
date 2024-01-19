locals {
  cluster_name    = var.cluster_name != "" ? var.cluster_name : "${var.dns_record}${random_string.cluster_id.result}"
  resource_group  = var.resource_group != "" ? var.resource_group : var.dns_record
  tls_secret_name = var.tls_certificate_type == "let_s_encrypt" ? var.tls_secret_name : "custom-tls-secret"
}

resource "random_string" "cluster_id" {
  length  = 6
  special = false
  upper   = false
}