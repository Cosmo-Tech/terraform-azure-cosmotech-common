output "out_platform_name" {
  value = azuread_application.platform.display_name
}

output "out_tenant_id" {
  value = var.tenant_id
}

output "out_platform_clientid" {
  value = azuread_application.platform.client_id
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
  value = azuread_application.network_adt.client_id
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

output "out_vnet_resource_group" {
  value = azurerm_resource_group.platform_rg.name
}

output "out_platform_resource_group_id" {
  value = azurerm_resource_group.platform_rg.id
}

output "out_adt_principal_id" {
  value = azuread_service_principal.network_adt.id
}

output "out_platform_resource_group_object" {
  value = azurerm_resource_group.platform_rg
}