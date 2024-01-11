resource "azurerm_private_dns_zone" "private_dns_blob" {
  name                = var.private_dns_name_blob
  resource_group_name = var.resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_link_blob" {
  name                  = "test-blob"
  resource_group_name   = var.resource_group
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_blob.name
  virtual_network_id    = var.vnet_id
}

resource "azurerm_private_dns_zone" "private_dns_queue" {
  name                = var.private_dns_name_queue
  resource_group_name = var.resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_link_queue" {
  name                  = "test-queue"
  resource_group_name   = var.resource_group
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_queue.name
  virtual_network_id    = var.vnet_id
}

resource "azurerm_private_dns_zone" "private_dns_table" {
  name                = var.private_dns_name_table
  resource_group_name = var.resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_link_table" {
  name                  = "test-table"
  resource_group_name   = var.resource_group
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_table.name
  virtual_network_id    = var.vnet_id
}

resource "azurerm_private_dns_zone" "private_dns_kusto" {
  name                = var.private_dns_name_kusto
  resource_group_name = var.resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_link_kusto" {
  name                  = "test-kusto"
  resource_group_name   = var.resource_group
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_kusto.name
  virtual_network_id    = var.vnet_id
}

resource "azurerm_private_dns_zone" "private_dns_eventhub" {
  name                = var.private_dns_name_eventhub
  resource_group_name = var.resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_link_eventhub" {
  name                  = "test-eventhub"
  resource_group_name   = var.resource_group
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_eventhub.name
  virtual_network_id    = var.vnet_id
}

resource "azurerm_private_dns_zone" "private_dns_adt" {
  name                = var.private_dns_name_adt
  resource_group_name = var.resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_link_adt" {
  name                  = "test-adt"
  resource_group_name   = var.resource_group
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_adt.name
  virtual_network_id    = var.vnet_id
}
