data "azurerm_resource_group" "platform" {
  count = var.deployment_type != "ARM" ? 0 : 1
  name  = var.resource_group
}

data "azurerm_virtual_network" "vnet_network" {
  count               = var.vnet_new == "new" ? 0 : 1
  name                = var.vnet_name
  resource_group_name = var.vnet_resource_group
}

data "azurerm_subnet" "subnet_platform" {
  count                = var.vnet_new == "new" ? 0 : 1
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_resource_group
}

locals {
  platform_vnet_id     = var.vnet_new == "new" ? module.create-network.0.vnet_id : data.azurerm_virtual_network.vnet_network.0.id
  platform_subnet_id   = var.vnet_new == "new" ? module.create-network.0.out_subnet_id : data.azurerm_subnet.subnet_platform.0.id
  resource_group       = var.deployment_type != "ARM" ? var.resource_group : data.azurerm_resource_group.platform.0.name
  network_clientsecret = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_platform_password : var.network_client_secret
  network_clientid     = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_platform_clientid : var.network_client_id
  network_sp_objectid  = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_adt_principal_id : var.network_sp_object_id
}
