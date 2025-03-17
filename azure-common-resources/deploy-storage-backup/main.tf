locals {
  velero_storage_name = "${var.storage_name}${random_string.random.result}"
}

resource "random_string" "random" {
  length  = 8
  special = false
}

resource "azurerm_storage_account" "storage_account" {
  name                            = lower(local.velero_storage_name)
  resource_group_name             = var.resource_group
  location                        = var.location
  account_tier                    = var.storage_tier
  account_replication_type        = var.storage_replication_type
  account_kind                    = var.storage_kind
  default_to_oauth_authentication = false
  min_tls_version                 = "TLS1_2"
  shared_access_key_enabled       = true
  access_tier                     = "Hot"
  public_network_access_enabled   = var.public_network_access_enabled # Must be false with private endpoints
  tags                            = var.tags

  network_rules {
    bypass                     = ["AzureServices"]
    default_action             = "Deny"
    ip_rules                   = [var.storage_csm_ip]
    virtual_network_subnet_ids = [var.network_subnet_id]
  }

}

resource "azurerm_storage_container" "velero_storage_container_name" {
  name                  = "velero"
  storage_account_id = azurerm_storage_account.storage_account.id
  container_access_type = "private"

  depends_on = [azurerm_storage_account.storage_account]
}


resource "kubernetes_secret" "velero_storage" {
  metadata {
    name      = "velero-storage"
    namespace = "default"
  }

  data = {
    name                 = azurerm_storage_account.storage_account.name
    resource_aks_managed = var.resource_aks_managed
    password             = azurerm_storage_account.storage_account.primary_access_key
  }

  type       = "Opaque"
  depends_on = [azurerm_storage_account.storage_account]
}
