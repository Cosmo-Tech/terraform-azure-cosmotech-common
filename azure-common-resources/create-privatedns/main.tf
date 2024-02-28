resource "azurerm_private_dns_zone" "private_dns_blob" {
  name                = var.private_dns_name_blob
  resource_group_name = var.resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_link_blob" {
  name                  = "private-link-blob"
  resource_group_name   = var.resource_group
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_blob.name
  virtual_network_id    = var.vnet_id
}
