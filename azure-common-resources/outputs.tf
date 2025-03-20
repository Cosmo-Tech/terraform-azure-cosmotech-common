output "out_subnet_id" {
  value = var.vnet_new == "new" ? module.create-network.0.out_subnet_id : null
}

output "out_network_sp_client_id" {
  value = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_network_sp_client_id : null
}

output "out_aks_cluster_config" {
  value     = var.kubernetes_azure_rbac_enabled ? module.create-cluster.aks_cluster_admin_config : module.create-cluster.aks_cluster_config
  sensitive = true
}

output "out_aks_cluster_name" {
  value = module.create-cluster.aks_cluster_name
}

output "out_network_name" {
  value = var.deployment_type != "ARM" ? module.create-network.0.out_network_name : var.network_name
}

output "out_network_sp_object_id" {
  value = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_network_sp_object_id : null
}

output "out_network_sp_name" {
  value = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_nerwork_sp_name : ""
}

output "out_backup_storage_account_name" {
  value = var.velero_deploy ? module.deploy-backup-storage.0.out_backup_storage_account_name : ""
}

output "out_backup_storage_account_key" {
  value     = var.velero_deploy ? module.deploy-backup-storage.0.out_backup_storage_account_key : ""
  sensitive = true
}

output "out_kubernetes_mc_resource_group_name" {
  value = module.create-cluster.aks_cluster_resource_group_managed
}
