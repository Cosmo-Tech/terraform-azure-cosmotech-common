output "out_cluster_name" {
  value = module.cosmotech-prerequisites.out_aks_cluster_name
}

output "out_project_name" {
  value = var.project_name
}

output "out_network_name" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_network_name : var.network_name
}

output "out_publicip_name" {

  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_public_ip_name : var.network_publicip_name
}

output "out_network_sp_client_id" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_network_sp_client_id : var.network_sp_client_id
}

output "out_network_sp_object_id" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_network_sp_object_id : var.network_sp_object_id
}

output "out_publicip_address" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_public_ip : null
}

output "out_tenant_id" {
  value = var.tenant_id
}

output "out_subscription_id" {
  value = var.subscription_id
}

output "out_api_dns_name" {
  value = var.deployment_type != "ARM" ? module.covar.network_sp_client_idsmotech-prerequisites.out_fqdn : null
}

output "out_keycloak_ingress_hostname" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_fqdn : null
}

output "out_kubernetes_resource_group" {
  value = var.kubernetes_resource_group
}

output "out_publicip_resource_group" {
  value = var.network_publicip_resource_group
}

output "out_network_resource_group" {
  value = var.network_resource_group
}

output "out_network_dns_record" {
  value = var.network_dns_record
}

output "out_network_app_name" {
  value = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_network_sp_name : null
}