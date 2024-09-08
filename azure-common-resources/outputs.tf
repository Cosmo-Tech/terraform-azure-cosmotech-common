output "out_public_ip" {
  value = var.deployment_type != "ARM" && var.create_publicip ? module.create-publicip.0.out_public_ip : null
}

output "out_subnet_id" {
  value = var.vnet_new == "new" ? module.create-network.0.out_subnet_id : null
}

output "out_public_ip_name" {
  value = var.deployment_type != "ARM" ? module.create-publicip.0.out_public_ip_name : null
}

output "out_ip_resource_group" {
  value = var.deployment_type != "ARM" ? module.create-publicip.0.out_ip_resource_group : null
}

output "out_network_sp_client_id" {
  value = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_network_sp_client_id : null
}

output "out_aks_phoenix_config" {
  value     = module.create-cluster.aks_phoenix_config
  sensitive = true
}

output "out_fqdn" {
  value = var.deployment_type != "ARM" ? module.create-publicip.0.out_fqdn : null
}

output "out_aks_cluster_name" {
  value = module.create-cluster.cluster.name
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