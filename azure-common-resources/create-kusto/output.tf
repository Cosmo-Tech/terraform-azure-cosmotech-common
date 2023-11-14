
output "adx_uri" {
  value = azurerm_kusto_cluster.kusto.uri
}

output "adx_ingestion_uri" {
  value = azurerm_kusto_cluster.kusto.data_ingestion_uri
}