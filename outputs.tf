output "out_cluster_name" {
  value = module.cosmotech-prerequisites.out_aks_cluster_name
}

output "out_vnet_name" {
  value = module.cosmotech-prerequisites.out_platform_vnet_name
}

output "out_public_ip_name" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_public_ip_name : var.public_ip_name
}

# output "out_platform_sp_name" {
#   value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_platform_sp_name : null
# }

output "out_network_sp_client_id" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_network_sp_client_id : null
}

output "out_network_sp_object_id" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_network_sp_object_id : null
}

# output "out_platform_sp_client_id" {
#   value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_platform_sp_client_id : null
# }

# output "out_platform_sp_object_id" {
#   value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_platform_sp_object_id : null
# }

output "out_public_ip_address" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_public_ip : null
}

output "out_tenant_id" {
  value = var.tenant_id
}

output "out_subscription_id" {
  value = var.subscription_id
}

output "out_api_dns_name" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_fqdn : null
}

output "out_common_resource_group" {
  value = var.resource_group
}

output "out_publicip_resource_group" {
  value = var.publicip_resource_group
}

output "out_vnet_resource_group" {
  value = var.vnet_resource_group
}