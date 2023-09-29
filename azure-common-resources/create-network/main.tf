locals {
  subnet_name  = "default"
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
  count               = var.create_vnet ? 1 : 0
  name                = "CosmoTech${var.customer_name}${var.project_name}${var.project_stage}VNet"
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = [local.vnet_iprange]

  subnet {
    name           = local.subnet_name
    address_prefix = local.vnet_iprange
  }

  tags = local.tags
}

resource "azurerm_role_assignment" "vnet_network_contributor" {
  count                = var.create_vnet ? 1 : 0
  scope                = azurerm_virtual_network.platform_vnet[0].id
  role_definition_name = "Network Contributor"
  principal_id         = var.adt_principal_id
}

resource "azurerm_private_dns_zone" "private_dns" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_link" {
  name                  = "test"
  resource_group_name   = var.resource_group
  private_dns_zone_name = azurerm_private_dns_zone.private_dns.name
  virtual_network_id    = azurerm_virtual_network.platform_vnet[0].id
}