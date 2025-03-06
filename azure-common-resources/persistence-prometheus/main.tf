locals {
  disk_master_name = "disk-prometheus-core"
}

resource "azurerm_managed_disk" "prometheus_master" {
  count                = var.pv_prometheus_provider == "azure" ? 1 : 0
  name                 = local.disk_master_name
  location             = var.location
  resource_group_name  = var.kubernetes_mc_resource_group_name
  storage_account_type = var.pv_prometheus_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.pv_prometheus_storage_gbi
}

resource "kubernetes_persistent_volume" "pv_prometheus_master" {
  metadata {
    name = "pv-${local.disk_master_name}"
  }
  spec {
    capacity = {
      storage = "${var.pv_prometheus_storage_gbi}Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pv_prometheus_storage_class_name
    persistent_volume_source {
      azure_disk {
        caching_mode  = "None"
        data_disk_uri = azurerm_managed_disk.prometheus_master.0.id
        disk_name     = azurerm_managed_disk.prometheus_master.0.name
        kind          = "Managed"
      }
    }
  }

  depends_on = [azurerm_managed_disk.prometheus_master]
}
