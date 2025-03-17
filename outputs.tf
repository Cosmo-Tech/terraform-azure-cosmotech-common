output "out_cluster_name" {
  value = module.cosmotech-prerequisites.out_aks_cluster_name
}

output "out_project_name" {
  value = var.project_name
}

output "out_network_name" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_network_name : var.network_name
}

output "out_network_sp_client_id" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_network_sp_client_id : var.network_sp_client_id
}

output "out_network_sp_object_id" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_network_sp_object_id : var.network_sp_object_id
}

output "out_tenant_id" {
  value = var.tenant_id
}

output "out_subscription_id" {
  value = var.subscription_id
}

output "out_kubernetes_resource_group" {
  value = var.kubernetes_resource_group
}

output "out_network_resource_group" {
  value = var.network_resource_group
}

output "out_network_app_name" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_network_sp_name : null
}

output "out_auto_restart_start_minutes" {
  value = var.start_minutes
}

output "out_auto_restart_start_hours" {
  value = var.start_hours
}

output "out_auto_restart_deploy" {
  value = var.auto_start_stop_deploy
}

output "out_backup_storage_account_name" {
  value = module.cosmotech-prerequisites.out_backup_storage_account_name
}

output "out_kubernetes_version" {
  value = var.kubernetes_version
}

output "out_location" {
  value = var.location
}

output "out_kubernetes_nodepool_system_type" {
  value = var.kubernetes_nodepool_system_type
}

output "out_kubernetes_basic_compute_type" {
  value = var.kubernetes_basic_compute_type
}

output "out_kubernetes_highcpu_compute_type" {
  value = var.kubernetes_highcpu_compute_type
}

output "out_kubernetes_highmemory_compute_type" {
  value = var.kubernetes_highmemory_compute_type
}

output "out_kubernetes_monitoring_type" {
  value = var.kubernetes_monitoring_type
}

output "out_kubernetes_services_type" {
  value = var.kubernetes_services_type
}

output "out_kubernetes_db_type" {
  value = var.kubernetes_db_type
}

output "out_kubernetes_max_basic_compute_instances" {
  value = var.kubernetes_max_basic_compute_instances
}

output "out_kubernetes_min_basic_compute_instances" {
  value = var.kubernetes_min_basic_compute_instances
}

output "out_kubernetes_max_db_instances" {
  value = var.kubernetes_max_db_instances
}

output "out_kubernetes_min_db_instances" {
  value = var.kubernetes_min_db_instances
}

output "out_kubernetes_max_highcpu_compute_instances" {
  value = var.kubernetes_max_highcpu_compute_instances
}

output "out_kubernetes_min_highcpu_compute_instances" {
  value = var.kubernetes_min_highcpu_compute_instances
}

output "out_kubernetes_max_highmemory_compute_instances" {
  value = var.kubernetes_max_highmemory_compute_instances
}

output "out_kubernetes_min_highmemory_compute_instances" {
  value = var.kubernetes_min_highmemory_compute_instances
}

output "out_kubernetes_max_monitoring_instances" {
  value = var.kubernetes_max_monitoring_instances
}

output "out_kubernetes_min_monitoring_instances" {
  value = var.kubernetes_min_monitoring_instances
}

output "out_kubernetes_max_services_instances" {
  value = var.kubernetes_max_services_instances
}

output "out_kubernetes_min_services_instances" {
  value = var.kubernetes_min_services_instances
}

output "out_kubernetes_max_system_instances" {
  value = var.kubernetes_max_system_instances
}

output "out_kubernetes_min_system_instances" {
  value = var.kubernetes_min_system_instances
}

output "out_kubernetes_mc_resource_group_name" {
  value = module.cosmotech-prerequisites.out_kubernetes_mc_resource_group_name
}
