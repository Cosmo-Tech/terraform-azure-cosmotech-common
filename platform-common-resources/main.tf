locals {
  host                   = var.kube_config.0.host
  client_certificate     = base64decode(var.kube_config.0.client_certificate)
  client_key             = base64decode(var.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(var.kube_config.0.cluster_ca_certificate)
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

# resource "kubernetes_namespace" "main_namespace" {
#   metadata {
#     name = var.namespace
#   }
# }

# resource "kubernetes_namespace" "monitoring_namespace" {
#   count = var.create_prometheus_stack ? 1 : 0
#   metadata {
#     name = var.monitoring_namespace
#   }
# }

resource "random_password" "prom_admin_password" {
  length  = 30
  special = false
}

resource "random_password" "redis_admin_password" {
  length  = 30
  special = false
}

resource "random_password" "argo_postgresql_password" {
  length  = 30
  special = false
}

resource "random_password" "argo_minio_secret_key" {
  length  = 30
  special = false
}

resource "random_password" "argo_minio_access_key" {
  length  = 30
  special = false
}