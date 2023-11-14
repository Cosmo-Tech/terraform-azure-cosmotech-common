resource "azurerm_kusto_cluster" "kusto" {
  name                = var.kusto_name
  location            = var.location
  resource_group_name = var.resource_group
  sku {
    name     = "Standard_D12_v2"
    capacity = 2
  }
  identity {
    type = "SystemAssigned"
  }
  trusted_external_tenants      = ["*"]
  disk_encryption_enabled       = false
  streaming_ingestion_enabled   = true
  purge_enabled                 = false
  double_encryption_enabled     = false
  engine                        = "V2"
  public_network_access_enabled = true
  tags                          = var.tags
}

resource "azurerm_private_endpoint" "kusto_private_endpoint" {
  name                = "kusto-privateendpoint"
  location            = var.location
  resource_group_name = var.resource_group
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "privatekustoconnection"
    private_connection_resource_id = azurerm_kusto_cluster.kusto.id
    is_manual_connection           = false
    subresource_names              = ["cluster"]
  }

  private_dns_zone_group {
    name                 = "storage-dns-zone-group"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }
}