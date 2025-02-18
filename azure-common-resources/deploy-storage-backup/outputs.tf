output "out_backup_storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}

output "out_backup_storage_account_key" {
  value     = azurerm_storage_account.storage_account.primary_access_key
  sensitive = true
}