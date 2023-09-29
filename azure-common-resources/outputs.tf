output "out_platform_sp_client_id" {
  value = module.create-platform-prerequisite.0.out_platform_clientid
}

output "out_platform_sp_client_secret" {
  value = module.create-platform-prerequisite.0.out_platform_password
}

output "out_public_ip" {
  value = module.create-platform-prerequisite.0.out_public_ip
}

# for test purpose
output "out_subnet_id" {
  value = module.create-network.out_subnet_id
}

output "out_public_ip_name" {
  value = module.create-platform-prerequisite.0.out_public_ip_name
}

output "out_ip_resource_group" {
  value = module.create-platform-prerequisite.0.out_ip_resource_group
}

output "out_networkadt_clientid" {
  value = module.create-platform-prerequisite.0.out_networkadt_clientid
}

output "out_network_adt_password" {
  value     = module.create-platform-prerequisite.0.out_network_adt_password
  sensitive = true
}

output "out_aks_phoenix_config" {
  value     = module.create-cluster.aks_phoenix_config
  sensitive = true
}

output "out_fqdn" {
  value = module.create-platform-prerequisite.0.out_fqdn
}