module "cosmotech-prerequisites" {
  source                                      = "./azure-common-resources"
  client_id                                   = var.client_id
  client_secret                               = var.client_secret
  tenant_id                                   = var.tenant_id
  subscription_id                             = var.subscription_id
  platform_url                                = var.platform_url
  identifier_uri                              = var.identifier_uri
  project_stage                               = var.project_stage
  customer_name                               = var.customer_name
  project_name                                = var.project_name
  owner_list                                  = var.owner_list
  audience                                    = var.audience
  publicip_resource_group                     = var.publicip_resource_group
  create_publicip                             = var.publicip_new_or_existing_or_none == "new" ? true : false
  create_dnsrecord                            = var.create_dnsrecord
  dns_zone_name                               = var.dns_zone_name
  dns_zone_rg                                 = var.dns_zone_rg
  dns_record                                  = var.dns_record
  api_version_path                            = var.api_version_path
  resource_group                              = local.resource_group
  image_path                                  = var.image_path
  cluster_name                                = local.cluster_name
  deployment_type                             = var.deployment_type
  adt_principal_id                            = var.adt_principal_id
  platform_client_id                          = var.platform_client_id
  platform_client_secret                      = var.platform_client_secret
  kubernetes_version                          = var.kubernetes_version
  location                                    = var.location
  vnet_name                                   = var.vnet_name
  vnet_new                                    = var.vnet_new
  subnet_name                                 = var.subnet_name
  vnet_iprange                                = var.virtual_network_address_prefix
  subnet_iprange                              = var.virtual_network_subnet_address_prefix
  vnet_resource_group                         = var.vnet_resource_group
  private_dns_name_blob                       = var.private_dns_name_blob
  kubernetes_max_db_instances                 = var.kubernetes_max_db_instances
  kubernetes_min_db_instances                 = var.kubernetes_min_db_instances
  kubernetes_max_services_instances           = var.kubernetes_max_services_instances
  kubernetes_max_monitoring_instances         = var.kubernetes_max_monitoring_instances
  kubernetes_max_highmemory_compute_instances = var.kubernetes_max_highmemory_compute_instances
  kubernetes_max_highcpu_compute_instances    = var.kubernetes_max_highcpu_compute_instances
  kubernetes_max_basic_compute_instances      = var.kubernetes_max_basic_compute_instances
  kubernetes_db_type                          = var.kubernetes_db_type
  kubernetes_services_type                    = var.kubernetes_services_type
  kubernetes_monitoring_type                  = var.kubernetes_monitoring_type
  kubernetes_highmemory_compute_type          = var.kubernetes_highmemory_compute_type
  kubernetes_highcpu_compute_type             = var.kubernetes_highcpu_compute_type
  kubernetes_basic_compute_type               = var.kubernetes_basic_compute_type
  kubernetes_nodepool_system_type             = var.kubernetes_nodepool_system_type
  kubernetes_network_plugin                   = var.kubernetes_network_plugin
}

module "cosmotech-platform" {
  source = "./platform-common-resources"

  subscription_id         = var.subscription_id
  tenant_id               = var.tenant_id
  client_id               = var.client_id     # Should be discarded
  client_secret           = var.client_secret # Should be discarded
  cluster_issuer_email    = var.cluster_issuer_email
  cluster_issuer_name     = var.cluster_issuer_name
  tls_secret_name         = var.tls_secret_name
  namespace               = var.namespace
  monitoring_namespace    = var.monitoring_namespace
  publicip_resource_group = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_ip_resource_group : var.publicip_resource_group
  api_dns_name            = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_fqdn : var.fqdn
  resource_group          = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_ip_resource_group : var.resource_group
  loadbalancer_ip         = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_public_ip : var.loadbalancer_ip
  kube_config             = module.cosmotech-prerequisites.out_aks_phoenix_config
}
