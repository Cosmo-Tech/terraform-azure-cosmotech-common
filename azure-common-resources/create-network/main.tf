locals {
  vnetname     = var.vnet_name != "" ? var.vnet_name : substr("CosmoTech${var.customer_name}${var.project_name}${var.project_stage}VNet", 0, 80)
  vnet_iprange = var.vnet_iprange != "" ? var.vnet_iprange : "10.21.0.0/16"
  tags = {
    vendor      = "cosmotech"
    stage       = var.project_stage
    customer    = var.customer_name
    project     = var.project_name
    cost_center = var.cost_center
  }
}

# Virtual Network
resource "azurerm_virtual_network" "platform_vnet" {
  name                = local.vnetname
  location            = var.location
  resource_group_name = var.vnet_resource_group
  address_space       = [var.vnet_iprange]

  subnet {
    name           = var.subnet_name
    address_prefix = var.subnet_iprange
  }

  tags = local.tags
}

resource "azurerm_role_assignment" "vnet_network_contributor" {
  scope                = azurerm_virtual_network.platform_vnet.id
  role_definition_name = "Network Contributor"
  principal_id         = var.network_sp_objectid
}
