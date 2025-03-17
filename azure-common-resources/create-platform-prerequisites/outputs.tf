output "out_nerwork_sp_name" {
  value = azuread_application.network_app.display_name
}

output "out_network_sp_client_id" {
  value = azuread_application.network_app.client_id
}

output "out_network_sp_object_id" {
  value = azuread_service_principal.network_app.object_id
}

output "out_network_sp_client_secret" {
  value     = azuread_application_password.network_app_password.value
  sensitive = true
}

output "out_vnet_resource_group" {
  value = data.azurerm_resource_group.platform_rg.name
}

output "out_platform_resource_group_id" {
  value = data.azurerm_resource_group.platform_rg.id
}

output "out_adt_principal_id" {
  value = azuread_service_principal.network_app.id
}

output "out_platform_resource_group_object" {
  value = data.azurerm_resource_group.platform_rg
}