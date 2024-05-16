locals {
  dns_prefix = "${var.cluster_name}-aks"
  tags = {
    vendor      = "cosmotech"
    stage       = var.project_stage
    customer    = var.customer_name
    project     = var.project_name
    cost_center = var.cost_center
  }
}

resource "azurerm_kubernetes_cluster" "phoenixcluster" {
  name                              = var.cluster_name
  location                          = var.location
  resource_group_name               = var.resource_group
  dns_prefix                        = local.dns_prefix
  kubernetes_version                = var.kubernetes_version
  role_based_access_control_enabled = true
  private_cluster_enabled           = false
  automatic_channel_upgrade         = "patch"
  sku_tier                          = "Standard"
  tags                              = local.tags

  network_profile {
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
    network_plugin    = var.kubernetes_network_plugin
    network_policy    = "calico"
  }

  http_application_routing_enabled = false

  service_principal {
    client_id     = var.network_clientid
    client_secret = var.network_clientsecret
  }

  default_node_pool {
    name                        = "system"
    temporary_name_for_rotation = var.temporary_name_for_rotation_system_pool
    orchestrator_version        = var.kubernetes_version
    vm_size                     = var.kubernetes_nodepool_system_type
    max_pods                    = 110
    max_count                   = 6
    min_count                   = 3
    enable_auto_scaling         = true
    os_disk_size_gb             = 128
    os_disk_type                = "Managed"
    vnet_subnet_id              = var.subnet_id
  }

  lifecycle {
    ignore_changes = [
      tags, azure_policy_enabled, microsoft_defender,
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "basic" {
  name                  = "basic"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.phoenixcluster.id
  orchestrator_version  = var.kubernetes_version
  vm_size               = var.kubernetes_basic_compute_type
  max_pods              = 110
  max_count             = var.kubernetes_max_basic_compute_instances
  min_count             = 1
  enable_auto_scaling   = true
  mode                  = "User"
  os_type               = "Linux"
  os_disk_size_gb       = 128
  os_disk_type          = "Managed"
  node_taints           = ["vendor=cosmotech:NoSchedule"]
  node_labels           = { "cosmotech.com/tier" = "compute", "cosmotech.com/size" = "basic" }
  vnet_subnet_id        = var.subnet_id
  tags                  = local.tags

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "highcpu" {
  name                  = "highcpu"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.phoenixcluster.id
  orchestrator_version  = var.kubernetes_version
  vm_size               = var.kubernetes_highcpu_compute_type
  max_pods              = 110
  max_count             = var.kubernetes_max_highcpu_compute_instances
  min_count             = 0
  enable_auto_scaling   = true
  mode                  = "User"
  os_type               = "Linux"
  os_disk_size_gb       = 128
  os_disk_type          = "Managed"
  node_taints           = ["vendor=cosmotech:NoSchedule"]
  node_labels           = { "cosmotech.com/tier" = "compute", "cosmotech.com/size" = "highcpu" }
  vnet_subnet_id        = var.subnet_id
  tags                  = local.tags

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "highmemory" {
  name                  = "highmemory"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.phoenixcluster.id
  orchestrator_version  = var.kubernetes_version
  vm_size               = var.kubernetes_highmemory_compute_type
  max_pods              = 110
  max_count             = var.kubernetes_max_highmemory_compute_instances
  min_count             = 0
  enable_auto_scaling   = true
  mode                  = "User"
  os_type               = "Linux"
  os_disk_size_gb       = 128
  os_disk_type          = "Managed"
  node_taints           = ["vendor=cosmotech:NoSchedule"]
  node_labels           = { "cosmotech.com/tier" = "compute", "cosmotech.com/size" = "highmemory" }
  vnet_subnet_id        = var.subnet_id
  tags                  = local.tags

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "services" {
  name                  = "services"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.phoenixcluster.id
  orchestrator_version  = var.kubernetes_version
  vm_size               = var.kubernetes_services_type
  max_pods              = 110
  max_count             = var.kubernetes_max_services_instances
  min_count             = 2
  enable_auto_scaling   = true
  mode                  = "User"
  os_type               = "Linux"
  os_disk_size_gb       = 128
  os_disk_type          = "Managed"
  node_taints           = ["vendor=cosmotech:NoSchedule"]
  node_labels           = { "cosmotech.com/tier" = "services" }
  vnet_subnet_id        = var.subnet_id
  tags                  = local.tags

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "db" {
  name                  = "db"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.phoenixcluster.id
  orchestrator_version  = var.kubernetes_version
  vm_size               = var.kubernetes_db_type
  max_pods              = 110
  max_count             = var.kubernetes_max_db_instances
  min_count             = var.kubernetes_min_db_instances
  enable_auto_scaling   = true
  mode                  = "User"
  os_type               = "Linux"
  os_disk_size_gb       = 128
  os_disk_type          = "Managed"
  node_taints           = ["vendor=cosmotech:NoSchedule"]
  node_labels           = { "cosmotech.com/tier" = "db" }
  vnet_subnet_id        = var.subnet_id
  tags                  = local.tags

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "monitoring" {
  name                  = "monitoring"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.phoenixcluster.id
  orchestrator_version  = var.kubernetes_version
  vm_size               = var.kubernetes_monitoring_type
  max_pods              = 110
  max_count             = var.kubernetes_max_monitoring_instances
  min_count             = 1
  enable_auto_scaling   = true
  mode                  = "User"
  os_type               = "Linux"
  os_disk_size_gb       = 128
  os_disk_type          = "Managed"
  node_taints           = ["vendor=cosmotech:NoSchedule"]
  node_labels           = { "cosmotech.com/tier" = "monitoring" }
  vnet_subnet_id        = var.subnet_id
  tags                  = local.tags

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
