module "cosmotech-prerequisites" {
  source                 = "./azure-common-resources"
  client_id              = var.client_id
  client_secret          = var.client_secret
  tenant_id              = var.tenant_id
  subscription_id        = var.subscription_id
  platform_url           = var.platform_url
  identifier_uri         = var.identifier_uri
  project_stage          = var.project_stage
  customer_name          = var.customer_name
  project_name           = var.project_name
  owner_list             = var.owner_list
  audience               = var.audience
  dns_zone_name          = var.dns_zone_name
  dns_zone_rg            = var.dns_zone_rg
  dns_record             = var.dns_record
  vnet_iprange           = var.vnet_iprange
  api_version_path       = var.api_version_path
  resource_group         = local.resource_group
  image_path             = var.image_path
  cluster_name           = local.cluster_name
  deployment_type        = var.deployment_type
  adt_principal_id       = var.adt_principal_id
  platform_client_id     = var.platform_client_id
  platform_client_secret = var.platform_client_secret
  kubernetes_version     = var.kubernetes_version
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
  api_dns_name         = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_fqdn : var.dns_record
  resource_group       = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_ip_resource_group : var.resource_group
  loadbalancer_ip      = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_public_ip : var.loadbalancer_ip
  kube_config          = module.cosmotech-prerequisites.out_aks_phoenix_config
}