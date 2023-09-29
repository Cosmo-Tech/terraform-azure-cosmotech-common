output "out_platform_name" {
  value = azuread_application.platform.display_name
}

output "out_tenant_id" {
  value = var.tenant_id
}

output "out_platform_clientid" {
  value = azuread_application.platform.application_id
}

output "out_platform_sp_object_id" {
  value = azuread_service_principal.platform.id
}

output "out_platform_password" {
  value     = var.create_secrets ? azuread_application_password.platform_password[0].value : null
  sensitive = true
}

output "out_nerworkadt_name" {
  value = azuread_application.network_adt.display_name
}

output "out_networkadt_sp_objectid" {
  value = azuread_service_principal.network_adt.object_id
}

output "out_networkadt_clientid" {
  value = azuread_application.network_adt.application_id
}

output "out_network_adt_password" {
  value     = var.create_secrets ? azuread_application_password.network_adt_password[0].value : null
  sensitive = true
}

output "out_platform_url" {
  value = var.platform_url
}

output "out_identifier_uri" {
  value = var.identifier_uri
}

output "out_public_ip" {
  value = azurerm_public_ip.publicip[0].ip_address
}

output "out_public_ip_name" {
  value = azurerm_public_ip.publicip[0].name
}

output "out_ip_resource_group" {
  value = azurerm_resource_group.platform_rg.name
}

output "out_fqdn" {
  value = var.create_dnsrecord ? "${azurerm_dns_a_record.platform_fqdn[0].name}.${var.dns_zone_name}" : null
}

output "out_vnet_resource_group" {
  value = azurerm_resource_group.platform_rg.name
}

output "out_platform_resource_group_id" {
  value = azurerm_resource_group.platform_rg.id
}

output "out_adt_principal_id" {
  value = azuread_service_principal.network_adt.id
}