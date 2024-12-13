module "cosmotech-prerequisites" {
  source = "./azure-common-resources"

  # azure
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  location        = var.location
  resource_group  = local.resource_group
  deployment_type = var.deployment_type
  owner_list      = var.owner_list

  audience = var.audience

  # project
  image_path    = var.project_image_path
  cost_center   = var.project_cost_center
  project_stage = var.project_stage
  project_name  = var.project_name
  customer_name = var.project_customer_name

  # network common
  identifier_uri            = var.network_identifier_uri
  create_publicip           = var.publicip_new_or_existing_or_none == "new" ? true : false
  publicip_resource_group   = var.deployment_type != "ARM" ? local.resource_group : var.network_publicip_resource_group
  create_dnsrecord          = var.network_dns_record_create
  dns_record                = var.network_dns_record
  dns_zone_name             = var.network_dns_zone_name
  dns_zone_rg               = var.network_dns_zone_rg
  network_sp_client_id      = var.network_sp_client_id
  network_sp_client_secret  = var.network_sp_client_secret
  network_sp_object_id      = var.network_sp_object_id
  network_name              = var.network_name
  vnet_new                  = var.network_new
  subnet_name               = var.network_subnet_name
  vnet_iprange              = var.network_virtual_address_prefix
  subnet_iprange            = var.network_virtual_subnet_address_prefix
  vnet_resource_group       = var.network_resource_group
  private_dns_name_blob     = var.network_private_dns_name_blob
  private_dns_name_queue    = var.network_private_dns_name_queue
  private_dns_name_table    = var.network_private_dns_name_table
  private_dns_name_adt      = var.network_private_dns_name_adt
  private_dns_name_eventhub = var.network_private_dns_name_eventhub

  # kubernetes
  cluster_name                                = local.cluster_name
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
  kubernetes_azure_rbac_enabled               = var.kubernetes_azure_rbac_enabled
  kubernetes_admin_group_object_ids           = var.kubernetes_admin_group_object_ids

  resource_group_name   = local.resource_group
  storage_account_name  = var.storage_account_name
  app_service_plan_name = var.app_service_plan_name
  function_app_name     = var.function_app_name

  holiday_country        = var.holiday_country
  solidarity_day         = var.solidarity_day
  adx_clusters_config    = var.adx_clusters_config
  aks_resource_group     = local.resource_group
  aks_cluster_name       = local.cluster_name
  powerbi_resource_group = var.powerbi_resource_group
  powerbi_name           = var.powerbi_name
  vm_resource_group      = var.vm_resource_group
  vm_name                = var.vm_name

  auto_start_stop_deploy = var.auto_start_stop_deploy
  start_hours            = var.start_hours
  stop_hours             = var.stop_hours
  start_minutes          = var.start_minutes
  stop_minutes           = var.stop_minutes

  # Storage Backup velero
  velero_location                      = var.velero_location
  velero_storage_tier                  = var.velero_storage_tier
  velero_storage_replication_type      = var.velero_storage_replication_type
  velero_resource_group                = var.velero_resource_group
  velero_public_network_access_enabled = var.velero_public_network_access_enabled
  velero_storage_name                  = var.velero_storage_name
  velero_tags                          = var.velero_tags
  velero_storage_kind                  = var.velero_storage_kind
  velero_storage_csm_ip                = var.velero_storage_csm_ip

}
