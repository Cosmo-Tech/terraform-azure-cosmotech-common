locals {
  cluster_name   = var.kubernetes_cluster_name != "" ? substr(var.kubernetes_cluster_name, 0, 80) : substr("${var.network_dns_record}${random_string.cluster_id.result}", 0, 80)
  resource_group = var.kubernetes_resource_group != "" ? substr(var.kubernetes_resource_group, 0, 80) : var.network_dns_record
}

resource "random_string" "cluster_id" {
  length  = 6
  special = false
  upper   = false
}

locals {
  kube_config            = module.cosmotech-prerequisites.out_aks_phoenix_config
  host                   = local.kube_config.0.host
  client_certificate     = base64decode(local.kube_config.0.client_certificate)
  client_key             = base64decode(local.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(local.kube_config.0.cluster_ca_certificate)
}
