locals {
  disk_loki_name    = "disk-loki-core"
  disk_grafana_name = "disk-grafana-core"
}

resource "azurerm_managed_disk" "loki_master" {
  count                = var.pv_loki_provider == "azure" && var.pv_loki_disk_source_existing ? 0 : 1
  name                 = local.disk_loki_name
  location             = var.location
  resource_group_name  = var.kubernetes_mc_resource_group_name
  storage_account_type = var.pv_loki_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.pv_loki_storage_gbi
}

data "azurerm_managed_disk" "disk_managed_loki" {
  count               = var.pv_loki_disk_source_existing ? 1 : 0
  name                = local.disk_loki_name
  resource_group_name = var.kubernetes_mc_resource_group_name
}

resource "kubernetes_persistent_volume" "pv_loki_master" {
  metadata {
    name = "pv-${local.disk_loki_name}"
  }
  spec {
    capacity = {
      storage = "${var.pv_loki_storage_gbi}Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pv_loki_storage_class_name
    persistent_volume_source {
      azure_disk {
        caching_mode  = "None"
        data_disk_uri = var.pv_loki_disk_source_existing ? data.azurerm_managed_disk.disk_managed_loki.0.id : azurerm_managed_disk.loki_master.0.id
        disk_name     = var.pv_loki_disk_source_existing ? data.azurerm_managed_disk.disk_managed_loki.0.name : azurerm_managed_disk.loki_master.0.name
        kind          = "Managed"
      }
    }
  }

  depends_on = [
    azurerm_managed_disk.loki_master,
    data.azurerm_managed_disk.disk_managed_loki
  ]
}


resource "azurerm_managed_disk" "grafana_master" {
  count                = var.pv_grafana_provider == "azure" && var.pv_grafana_disk_source_existing ? 0 : 1
  name                 = local.disk_grafana_name
  location             = var.location
  resource_group_name  = var.kubernetes_mc_resource_group_name
  storage_account_type = var.pv_grafana_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.pv_grafana_storage_gbi
}

data "azurerm_managed_disk" "disk_managed_grafana" {
  count               = var.pv_grafana_disk_source_existing ? 1 : 0
  name                = local.disk_grafana_name
  resource_group_name = var.kubernetes_mc_resource_group_name
}

resource "kubernetes_persistent_volume" "pv_grafana_master" {
  metadata {
    name = "pv-${local.disk_grafana_name}"
  }
  spec {
    capacity = {
      storage = "${var.pv_grafana_storage_gbi}Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.pv_grafana_storage_class_name
    persistent_volume_source {
      azure_disk {
        caching_mode  = "None"
        data_disk_uri = var.pv_grafana_disk_source_existing ? data.azurerm_managed_disk.disk_managed_grafana.0.id : azurerm_managed_disk.grafana_master.0.id
        disk_name     = var.pv_grafana_disk_source_existing ? data.azurerm_managed_disk.disk_managed_grafana.0.name : azurerm_managed_disk.grafana_master.0.name
        kind          = "Managed"
      }
    }
  }

  depends_on = [
    azurerm_managed_disk.grafana_master,
    data.azurerm_managed_disk.disk_managed_grafana
  ]
}
