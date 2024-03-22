locals {
  tags = {
    vendor      = "cosmotech"
    stage       = var.project_stage
    customer    = var.customer_name
    project     = var.project_name
    cost_center = var.cost_center
  }
}

# Public IP
resource "azurerm_public_ip" "publicip" {
  count               = var.create_publicip ? 1 : 0
  name                = substr("CosmoTech${var.customer_name}${var.project_name}${var.project_stage}PublicIP", 0, 80)
  resource_group_name = var.publicip_resource_group.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.tags
}

resource "azurerm_role_assignment" "publicip_contributor" {
  count                = var.create_publicip ? 1 : 0
  scope                = var.publicip_resource_group.id
  role_definition_name = "Contributor"
  principal_id         = var.network_sp_objectid
}

resource "azurerm_role_assignment" "publicip_owner" {
  count                = var.create_publicip ? 1 : 0
  scope                = var.create_publicip ? azurerm_public_ip.publicip[0].id : null
  role_definition_name = "Owner"
  principal_id         = var.platform_client_id
}

resource "azurerm_dns_a_record" "platform_fqdn" {
  depends_on          = [azurerm_public_ip.publicip]
  count               = var.create_publicip && var.create_dnsrecord ? 1 : 0
  name                = var.dns_record
  zone_name           = var.dns_zone_name
  resource_group_name = var.dns_zone_rg
  ttl                 = 300
  target_resource_id  = azurerm_public_ip.publicip[0].id
}