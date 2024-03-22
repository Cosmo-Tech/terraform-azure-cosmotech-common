output "out_cluster_name" {
  value = module.cosmotech-prerequisites.out_aks_cluster_name
}

output "out_vnet_name" {
  value = module.cosmotech-prerequisites.out_platform_vnet_name
}

output "out_public_ip_name" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_public_ip_name : var.public_ip_name
}

output "out_platform_sp_name" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.0.out_platform_sp_name : null
}

output "out_platform_sp_object_id" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.0.out_platform_sp_object_id : null
}

output "out_networkadt_clientid" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.0.out_networkadt_clientid : null
}

output "out_networkadt_sp_objectid" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.0.out_networkadt_sp_objectid : null
}