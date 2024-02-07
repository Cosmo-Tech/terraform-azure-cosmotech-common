locals {
  host                   = var.kube_config.0.host
  client_certificate     = base64decode(var.kube_config.0.client_certificate)
  client_key             = base64decode(var.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(var.kube_config.0.cluster_ca_certificate)
  tls_secret_name        = var.tls_certificate_type != "none" ? var.tls_secret_name : ""
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

resource "random_password" "prom_admin_password" {
  length  = 30
  special = false
}

resource "random_password" "redis_admin_password" {
  length  = 30
  special = false
}