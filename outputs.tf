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
