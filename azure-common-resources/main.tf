data "azurerm_resource_group" "platform" {
  count = var.deployment_type != "ARM" ? 0 : 1
  name  = var.resource_group
}

data "azurerm_virtual_network" "vnet_network" {
  count               = var.vnet_new == "new" ? 0 : 1
  name                = var.network_name
  resource_group_name = var.vnet_resource_group
}

data "azurerm_subnet" "subnet_platform" {
  count                = var.vnet_new == "new" ? 0 : 1
  name                 = var.subnet_name
  virtual_network_name = var.network_name
  resource_group_name  = var.vnet_resource_group
}

locals {
  platform_vnet_id         = var.vnet_new == "new" ? module.create-network.0.out_vnet_id : data.azurerm_virtual_network.vnet_network.0.id
  platform_subnet_id       = var.vnet_new == "new" ? module.create-network.0.out_subnet_id : data.azurerm_subnet.subnet_platform.0.id
  resource_group           = var.deployment_type != "ARM" ? var.resource_group : data.azurerm_resource_group.platform.0.name
  vnet_resource_group      = var.deployment_type != "ARM" ? var.resource_group : var.vnet_resource_group
  network_sp_client_id     = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_network_sp_client_id : var.network_sp_client_id
  network_sp_object_id     = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_network_sp_object_id : var.network_sp_object_id
  network_sp_client_secret = var.deployment_type != "ARM" ? module.create-platform-prerequisite.0.out_network_sp_client_secret : var.network_sp_client_secret
}
