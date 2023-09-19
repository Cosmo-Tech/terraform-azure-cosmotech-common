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

# variable "kube_config" {

# }

# locals {
#   host                   = local.kube_config.0.host
#   client_certificate     = base64decode(local.kube_config.0.client_certificate)
#   client_key             = base64decode(local.kube_config.0.client_key)
#   cluster_ca_certificate = base64decode(local.kube_config.0.cluster_ca_certificate)
# }

# provider "kubernetes" {
#   host                   = local.host
#   client_certificate     = local.client_certificate
#   client_key             = local.client_key
#   cluster_ca_certificate = local.cluster_ca_certificate
# }

# provider "helm" {
#   kubernetes {
#     host                   = local.host
#     client_certificate     = local.client_certificate
#     client_key             = local.client_key
#     cluster_ca_certificate = local.cluster_ca_certificate
#   }
# }

# provider "kubectl" {
#   host                   = local.host
#   client_certificate     = local.client_certificate
#   client_key             = local.client_key
#   cluster_ca_certificate = local.cluster_ca_certificate

#   load_config_file = false
# }

# variable "tenant_list" {
#   type    = list(string)
#   default = ["tenant1", "tenant2"]
# }

module "cosmotech-prerequisites" {
  source           = "./azure-common-resources"
  client_id        = var.client_id
  client_secret    = var.client_secret
  tenant_id        = var.tenant_id
  subscription_id  = var.subscription_id
  platform_url     = var.platform_url
  identifier_uri   = var.identifier_uri
  project_stage    = var.project_stage
  customer_name    = var.customer_name
  project_name     = var.project_name
  owner_list       = var.owner_list
  audience         = var.audience
  dns_zone_name    = var.dns_zone_name
  dns_zone_rg      = var.dns_zone_rg
  dns_record       = var.dns_record
  vnet_iprange     = var.vnet_iprange
  api_version_path = var.api_version_path
  resource_group   = local.resource_group
  image_path       = var.image_path
  cluster_name     = local.cluster_name
}

module "cosmotech-platform" {
  source = "./platform-common-resources"

  subscription_id      = var.subscription_id
  tenant_id            = var.tenant_id
  client_id            = var.client_id     # Should be discarded
  client_secret        = var.client_secret # Should be discarded
  cluster_issuer_email = var.cluster_issuer_email
  cluster_issuer_name  = var.cluster_issuer_name
  tls_secret_name      = var.tls_secret_name
  namespace            = var.namespace
  monitoring_namespace = var.monitoring_namespace
  api_dns_name         = module.cosmotech-prerequisites.out_fqdn
  resource_group       = module.cosmotech-prerequisites.out_ip_resource_group
  loadbalancer_ip      = module.cosmotech-prerequisites.out_public_ip
  kube_config          = module.cosmotech-prerequisites.out_aks_phoenix_config
  # platform_sp_client_id     = module.cosmotech-prerequisites.out_platform_sp_client_id
  # platform_sp_client_secret = module.cosmotech-prerequisites.out_platform_sp_client_secret
  # network_adt_clientid = module.cosmotech-prerequisites.out_networkadt_clientid
  # network_adt_password = module.cosmotech-prerequisites.out_network_adt_password

  # depends_on = [ module.cosmotech-prerequisites ]
}