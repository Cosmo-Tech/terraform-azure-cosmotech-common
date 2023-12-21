output "out_cluster_name" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_aks_cluster_name : null
}

output "out_vnet_name" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_platform_vnet_name : null
}

output "out_platform_sp_name" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_platform_sp_name : null
}

output "out_platform_public_ip" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_public_ip_name : null
}