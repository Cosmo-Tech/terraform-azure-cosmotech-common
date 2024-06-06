locals {
  cluster_name    = var.cluster_name != "" ? substr(var.cluster_name, 0, 80) : substr("${var.dns_record}${random_string.cluster_id.result}", 0, 80)
  resource_group  = var.resource_group != "" ? substr(var.resource_group, 0, 80) : var.dns_record
  tls_secret_name = var.tls_certificate_type == "let_s_encrypt" ? var.tls_secret_name : "custom-tls-secret"
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

provider "kubernetes" {
  host                   = local.host
  client_certificate     = local.client_certificate
  client_key             = local.client_key
  cluster_ca_certificate = local.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = local.host
    client_certificate     = local.client_certificate
    client_key             = local.client_key
    cluster_ca_certificate = local.cluster_ca_certificate
  }
}

provider "kubectl" {
  host                   = local.host
  client_certificate     = local.client_certificate
  client_key             = local.client_key
  cluster_ca_certificate = local.cluster_ca_certificate

  load_config_file = false
}
