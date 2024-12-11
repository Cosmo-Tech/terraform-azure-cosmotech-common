module "create-platform-prerequisite" {
  source = "./create-platform-prerequisites"

  count = var.deployment_type != "ARM" ? 1 : 0

  project_stage  = var.project_stage
  project_name   = var.project_name
  owner_list     = var.owner_list
  location       = var.location
  resource_group = var.resource_group
  customer_name  = var.customer_name
  image_path     = var.image_path
  cost_center    = var.cost_center
}

module "create-network" {
  source = "./create-network"

  count = var.vnet_new == "new" ? 1 : 0

  resource_group      = local.resource_group
  vnet_resource_group = local.vnet_resource_group
  network_name        = var.network_name
  vnet_iprange        = var.vnet_iprange
  location            = var.location
  customer_name       = var.customer_name
  cost_center         = var.cost_center
  project_stage       = var.project_stage
  project_name        = var.project_name
  subscription_id     = var.subscription_id
  subnet_iprange      = var.subnet_iprange
  subnet_name         = var.subnet_name
  network_publicip_id = var.network_publicip_id
  network_sp_objectid = module.create-platform-prerequisite.0.out_network_sp_object_id

  depends_on = [module.create-platform-prerequisite]
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

  depends_on = [
    module.create-platform-prerequisite,
    module.create-network
  ]
}

module "create-cluster" {
  source = "./create-cluster"

  tenant_id                                   = var.tenant_id
  network_clientid                            = local.network_sp_client_id
  network_clientsecret                        = local.network_sp_client_secret
  network_client_object_id                    = local.network_sp_object_id
  subnet_id                                   = local.platform_subnet_id
  kubernetes_admin_group_object_ids           = var.kubernetes_admin_group_object_ids
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
  kubernetes_min_highcpu_compute_instances    = var.kubernetes_min_highcpu_compute_instances
  kubernetes_nodepool_system_name             = var.kubernetes_nodepool_system_name
  kubernetes_azure_rbac_enabled               = var.kubernetes_azure_rbac_enabled
  kubernetes_tekton_compute_type              = var.kubernetes_tekton_compute_type
  kubernetes_max_tekton_pods                  = var.kubernetes_max_tekton_pods
  kubernetes_max_tekton_compute_instances     = var.kubernetes_max_tekton_compute_instances
  kubernetes_min_tekton_compute_instances     = var.kubernetes_min_tekton_compute_instances
  kubernetes_tekton_enable_auto_scaling       = var.kubernetes_tekton_enable_auto_scaling
  kubernetes_tekton_os_disk_size              = var.kubernetes_tekton_os_disk_size

  depends_on = [
    module.create-platform-prerequisite,
    module.create-network,
    module.create-privatedns,
  ]
}

module "create-auto-restart" {
  source = "./create-auto-restart"

  count = var.auto_start_stop_deploy ? 1 : 0

  subscription_id       = var.subscription_id
  tenant_id             = var.tenant_id
  client_id             = local.network_sp_client_id
  client_secret         = local.network_sp_client_secret
  resource_group_name   = var.resource_group_name
  location              = var.location
  storage_account_name  = var.storage_account_name
  app_service_plan_name = var.app_service_plan_name
  function_app_name     = var.function_app_name

  # If existing storage account
  use_existing_storage_account = var.use_existing_storage_account

  holiday_country        = var.holiday_country
  solidarity_day         = var.solidarity_day
  adx_clusters_config    = var.adx_clusters_config
  aks_resource_group     = var.aks_resource_group
  aks_cluster_name       = var.aks_cluster_name
  powerbi_resource_group = var.powerbi_resource_group
  powerbi_name           = var.powerbi_name
  vm_resource_group      = var.vm_resource_group
  vm_name                = var.vm_name
  start_hours            = var.start_hours
  stop_hours             = var.stop_hours
  start_minutes          = var.start_minutes
  stop_minutes           = var.stop_minutes

  depends_on = [
    module.create-platform-prerequisite
  ]
}


module "deploy-backup-storage" {
  source = "./deploy-storage-backup"

  tags                          = var.velero_tags
  storage_name                  = var.velero_storage_name
  location                      = var.velero_location
  resource_group                = var.velero_resource_group
  storage_tier                  = var.velero_storage_tier
  storage_replication_type      = var.velero_storage_replication_type
  storage_kind                  = var.velero_storage_kind
  public_network_access_enabled = var.velero_public_network_access_enabled
  storage_csm_ip                = var.velero_storage_csm_ip
  resource_aks_managed          = module.create-cluster.aks_cluster_resource_group_managed
  network_subnet_id             = module.create-network.0.out_subnet_id

  depends_on = [module.create-cluster, module.create-network]
}
