module "create-auto-restart" {
  source = "./create-auto-restart"

  count = var.auto_start_stop_deploy ? 1 : 0

  subscription_id        = var.subscription_id
  tenant_id              = var.tenant_id
  client_id              = local.network_sp_client_id
  client_secret          = local.network_sp_client_secret
  resource_group_name    = var.resource_group_name
  location               = var.location
  storage_account_name   = var.storage_account_name
  app_service_plan_name  = var.app_service_plan_name
  function_app_name      = var.function_app_name
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