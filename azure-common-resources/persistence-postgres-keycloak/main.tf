locals {
  disk_master_name = "disk-postgres-core-keycloak"
}

resource "azurerm_managed_disk" "postgres_keycloak_master" {
  count                = var.pv_keycloak_postgres_provider == "azure" && var.pv_keycloak_disk_source_existing ? 0 : 1
  name                 = local.disk_master_name
  location             = var.location
  resource_group_name  = var.kubernetes_mc_resource_group_name
  storage_account_type = var.pv_keycloak_postgres_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.pv_keycloak_postgres_storage_gbi
}

data "azurerm_managed_disk" "disk_managed_postgres_keycloak" {
  count               = var.pv_keycloak_postgres_provider == "azure" && var.pv_keycloak_disk_source_existing ? 1 : 0
  name                = local.disk_master_name
  resource_group_name = var.kubernetes_mc_resource_group_name
}

resource "kubernetes_persistent_volume" "pv_postgres_keycloak_master" {
  metadata {
    name = "pv-${local.disk_master_name}"
  }
  spec {
    capacity = {
      storage = "${var.pv_keycloak_postgres_storage_gbi}Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pv_keycloak_postgres_storage_class_name
    persistent_volume_source {
      azure_disk {
        caching_mode  = "None"
        data_disk_uri = var.pv_keycloak_disk_source_existing ? data.azurerm_managed_disk.disk_managed_postgres_keycloak.0.id : azurerm_managed_disk.postgres_keycloak_master.0.id
        disk_name     = var.pv_keycloak_disk_source_existing ? data.azurerm_managed_disk.disk_managed_postgres_keycloak.0.name : azurerm_managed_disk.postgres_keycloak_master.0.name
        kind          = "Managed"
      }
    }
  }

  depends_on = [
    azurerm_managed_disk.postgres_keycloak_master,
    data.azurerm_managed_disk.disk_managed_postgres_keycloak
  ]
}
