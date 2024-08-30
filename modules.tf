module "cosmotech-prerequisites" {
  source = "./azure-common-resources"

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  tenant_name     = var.tenant_name
  location        = var.location

  resource_group   = local.resource_group
  cluster_name     = local.cluster_name
  deployment_type  = var.deployment_type
  image_path       = var.image_path
  platform_url     = var.platform_url
  identifier_uri   = var.identifier_uri
  owner_list       = var.owner_list
  audience         = var.audience
  api_version_path = var.api_version_path

  user_app_role  = var.user_app_role
  create_secrets = var.create_secrets
  create_babylon = var.create_babylon
  cost_center    = var.cost_center

  # publicip
  create_publicip         = var.publicip_new_or_existing_or_none == "new" ? true : false
  create_dnsrecord        = var.create_dnsrecord
  publicip_resource_group = var.deployment_type != "ARM" ? local.resource_group : var.publicip_resource_group
  project_stage           = var.project_stage
  project_name            = var.project_name
  customer_name           = var.customer_name
  dns_record              = var.dns_record
  dns_zone_name           = var.dns_zone_name
  dns_zone_rg             = var.dns_zone_rg

  # network common
  network_client_id     = var.network_client_id
  network_client_secret = var.network_client_secret
  network_sp_object_id  = var.network_sp_object_id

  # vnet
  vnet_name           = var.vnet_name
  vnet_new            = var.vnet_new
  subnet_name         = var.subnet_name
  vnet_iprange        = var.virtual_network_address_prefix
  subnet_iprange      = var.virtual_network_subnet_address_prefix
  vnet_resource_group = var.vnet_resource_group

  # privatelink dns
  private_dns_name_blob     = var.private_dns_name_blob
  private_dns_name_queue    = var.private_dns_name_queue
  private_dns_name_table    = var.private_dns_name_table
  private_dns_name_adt      = var.private_dns_name_adt
  private_dns_name_eventhub = var.private_dns_name_eventhub

  kubernetes_version                          = var.kubernetes_version
  kubernetes_max_db_instances                 = var.kubernetes_max_db_instances
  kubernetes_min_db_instances                 = var.kubernetes_min_db_instances
  kubernetes_max_services_instances           = var.kubernetes_max_services_instances
  kubernetes_max_monitoring_instances         = var.kubernetes_max_monitoring_instances
  kubernetes_min_monitoring_instances         = var.kubernetes_min_monitoring_instances
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
  temporary_name_for_rotation_system_pool     = var.temporary_name_for_rotation_system_pool
  kubernetes_min_services_instances           = var.kubernetes_min_services_instances
  kubernetes_min_highmemory_compute_instances = var.kubernetes_min_highmemory_compute_instances
  kubernetes_min_highcpu_compute_instances    = var.kubernetes_min_highcpu_compute_instances
  kubernetes_min_basic_compute_instances      = var.kubernetes_min_basic_compute_instances
  kubernetes_min_system_instances             = var.kubernetes_min_system_instances
  kubernetes_max_system_instances             = var.kubernetes_max_system_instances
  kubernetes_max_monitoring_pods              = var.kubernetes_max_monitoring_pods
  kubernetes_max_db_pods                      = var.kubernetes_max_db_pods
  kubernetes_max_highmemory_pods              = var.kubernetes_max_highmemory_pods
  kubernetes_max_services_pods                = var.kubernetes_max_services_pods
  kubernetes_max_basic_pods                   = var.kubernetes_max_basic_pods
  kubernetes_max_highcpu_pods                 = var.kubernetes_max_highcpu_pods
  kubernetes_max_system_pods                  = var.kubernetes_max_system_pods
  kubernetes_basic_enable_auto_scaling        = var.kubernetes_basic_enable_auto_scaling
  kubernetes_db_enable_auto_scaling           = var.kubernetes_db_enable_auto_scaling
  kubernetes_highcpu_enable_auto_scaling      = var.kubernetes_highcpu_enable_auto_scaling
  kubernetes_highmemory_enable_auto_scaling   = var.kubernetes_highmemory_enable_auto_scaling
  kubernetes_monitoring_enable_auto_scaling   = var.kubernetes_monitoring_enable_auto_scaling
  kubernetes_services_enable_auto_scaling     = var.kubernetes_services_enable_auto_scaling
  kubernetes_system_enable_auto_scaling       = var.kubernetes_system_enable_auto_scaling
  kubernetes_db_os_disk_size                  = var.kubernetes_db_os_disk_size
  kubernetes_highcpu_os_disk_size             = var.kubernetes_highcpu_os_disk_size
  kubernetes_basic_os_disk_size               = var.kubernetes_basic_os_disk_size
  kubernetes_highmemory_os_disk_size          = var.kubernetes_highmemory_os_disk_size
  kubernetes_monitoring_os_disk_size          = var.kubernetes_monitoring_os_disk_size
  kubernetes_services_os_disk_size            = var.kubernetes_services_os_disk_size
  kubernetes_system_os_disk_size              = var.kubernetes_system_os_disk_size
  kubernetes_nodepool_system_name             = var.kubernetes_nodepool_system_name
}