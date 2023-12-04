data "azurerm_resource_group" "platform" {
  count = var.deployment_type != "ARM" ? 0 : 1
  name  = var.resource_group
}

locals {
  resource_group    = var.deployment_type != "ARM" ? var.resource_group : data.azurerm_resource_group.platform.0.name
  platform_password = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_platform_password : var.platform_client_secret
  platform_clientid = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_platform_clientid : var.platform_client_id
  adt_principal_id  = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_adt_principal_id : var.adt_principal_id
}