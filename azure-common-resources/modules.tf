module "create-cluster" {
  source = "./create-cluster"

  network_clientid     = local.network_clientid
  network_clientsecret = local.network_clientsecret
  subnet_id            = local.platform_subnet_id

  location                                    = var.location
  resource_group                              = var.resource_group
  cluster_name                                = var.cluster_name
  project_stage                               = var.project_stage
  project_name                                = var.project_name
  customer_name                               = var.customer_name
  cost_center                                 = var.cost_center
  kubernetes_version                          = var.kubernetes_version
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

  depends_on = [
    module.create-platform-prerequisite, module.create-network, module.create-privatedns
  ]
}

module "create-network" {
  source = "./create-network"

  count = var.vnet_new == "new" ? 1 : 0

  network_sp_objectid = local.network_sp_objectid
  resource_group      = local.resource_group

  vnet_name           = var.vnet_name
  vnet_iprange        = var.vnet_iprange
  location            = var.location
  customer_name       = var.customer_name
  cost_center         = var.cost_center
  project_stage       = var.project_stage
  project_name        = var.project_name
  subscription_id     = var.subscription_id
  vnet_resource_group = local.vnet_resource_group

  depends_on = [module.create-platform-prerequisite]
}

module "create-platform-prerequisite" {
  source = "./create-platform-prerequisites"

  count = var.deployment_type != "ARM" ? 1 : 0

  tenant_id        = var.tenant_id
  subscription_id  = var.subscription_id
  client_id        = var.client_id
  client_secret    = var.client_secret
  platform_url     = var.platform_url
  identifier_uri   = var.identifier_uri
  project_stage    = var.project_stage
  project_name     = var.project_name
  owner_list       = var.owner_list
  audience         = var.audience
  location         = var.location
  resource_group   = var.resource_group
  dns_zone_name    = var.dns_zone_name
  dns_zone_rg      = var.dns_zone_rg
  dns_record       = var.dns_record
  vnet_iprange     = var.vnet_iprange
  api_version_path = var.api_version_path
  customer_name    = var.customer_name
  user_app_role    = var.user_app_role
  image_path       = var.image_path
  cost_center      = var.cost_center
}

module "create-privatedns" {
  source = "./create-privatedns"

  resource_group = local.resource_group
  vnet_id        = local.platform_vnet_id

  private_dns_name_blob     = var.private_dns_name_blob
  private_dns_name_adt      = var.private_dns_name_adt
  private_dns_name_queue    = var.private_dns_name_queue
  private_dns_name_table    = var.private_dns_name_table
  private_dns_name_eventhub = var.private_dns_name_eventhub
}

module "create-publicip" {
  source = "./create-publicip"

  count = var.create_publicip ? 1 : 0

  network_sp_objectid = local.network_sp_objectid
  publicip_resource_group = local.publicip_resource_group

  cost_center             = var.cost_center
  customer_name           = var.customer_name
  project_name            = var.project_name
  location                = var.location
  project_stage           = var.project_stage
  create_publicip         = var.create_publicip # == "new" ? true : false
  create_dnsrecord        = var.create_dnsrecord
  dns_record              = var.dns_record
  dns_zone_name           = var.dns_zone_name
  dns_zone_rg             = var.dns_zone_rg
}
