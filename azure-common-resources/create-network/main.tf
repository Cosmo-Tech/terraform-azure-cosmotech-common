locals {
  local_vnet_name = var.network_name == "" ? substr("CosmoTech${var.customer_name}${var.project_name}${var.project_stage}VNet", 0, 80) : var.network_name
  vnet_iprange    = var.vnet_iprange != "" ? var.vnet_iprange : "10.21.0.0/24"
  tags = {
    vendor      = "cosmotech"
    stage       = var.project_stage
    customer    = var.customer_name
    project     = var.project_name
    cost_center = var.cost_center
  }
}

locals {
  subscription = "/subscriptions/${var.subscription_id}"
  rg_name      = "resourceGroups/${var.resource_group}"
  subnetname   = "${azurerm_virtual_network.network_vnet.name}/subnets/${var.subnet_name}"
}

# Virtual Network
resource "azurerm_virtual_network" "network_vnet" {
  name                = local.local_vnet_name
  location            = var.location
  resource_group_name = var.vnet_resource_group
  address_space       = [var.vnet_iprange]

  subnet {
    name              = var.subnet_name
    address_prefixes  = [var.subnet_iprange]
    service_endpoints = ["Microsoft.Storage.Global"]
  }

  tags = local.tags
}

resource "azurerm_role_assignment" "publicip_contributor" {
  scope                = var.network_publicip_id
  role_definition_name = "Contributor"
  principal_id         = var.network_sp_objectid
}


# Resource group
data "azurerm_resource_group" "platform_rg" {
  name     = var.resource_group
}

resource "azurerm_role_assignment" "rg_contributor" {
  scope                = data.azurerm_resource_group.platform_rg.id
  role_definition_name = "Contributor"
  principal_id         = var.network_sp_objectid
}