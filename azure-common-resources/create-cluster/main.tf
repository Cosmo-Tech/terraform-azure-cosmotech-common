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

data "azurerm_resource_group" "current" {
  name = var.resource_group
}

resource "azurerm_role_assignment" "k8s_admin" {
  scope                = data.azurerm_resource_group.current.id
  role_definition_name = "Azure Kubernetes Service RBAC Admin"
  for_each             = toset(var.kubernetes_admin_group_object_ids)
  principal_id         = each.key
}

resource "azurerm_kubernetes_cluster" "phoenixcluster" {
  name                              = var.cluster_name
  location                          = var.location
  resource_group_name               = var.resource_group
  dns_prefix                        = local.dns_prefix
  kubernetes_version                = var.kubernetes_version
  role_based_access_control_enabled = var.kubernetes_azure_rbac_enabled
  private_cluster_enabled           = false
  azure_active_directory_role_based_access_control {
    azure_rbac_enabled     = var.kubernetes_azure_rbac_enabled
    tenant_id              = var.tenant_id
    admin_group_object_ids = var.kubernetes_admin_group_object_ids
  }
  automatic_upgrade_channel = "patch"
  sku_tier                  = "Standard"
  tags                      = local.tags

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
    name                        = substr(var.kubernetes_nodepool_system_name, 0, 80)
    temporary_name_for_rotation = substr(var.temporary_name_for_rotation_system_pool, 0, 12)
    orchestrator_version        = var.kubernetes_version
    vm_size                     = var.kubernetes_nodepool_system_type
    max_pods                    = var.kubernetes_max_system_pods
    max_count                   = var.kubernetes_max_system_instances
    min_count                   = var.kubernetes_min_system_instances
    auto_scaling_enabled        = var.kubernetes_system_enable_auto_scaling
    os_disk_size_gb             = var.kubernetes_system_os_disk_size
    os_disk_type                = "Managed"
    vnet_subnet_id              = var.subnet_id
    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }

  lifecycle {
    ignore_changes = [
      tags, azure_policy_enabled, microsoft_defender
    ]
  }

  depends_on = [azurerm_role_assignment.k8s_admin]
}

resource "azurerm_kubernetes_cluster_node_pool" "monitoring" {
  name                        = "monitoring"
  kubernetes_cluster_id       = azurerm_kubernetes_cluster.phoenixcluster.id
  temporary_name_for_rotation = substr(var.temporary_name_for_rotation_monitoring_pool, 0, 12)
  orchestrator_version        = var.kubernetes_version
  vm_size                     = var.kubernetes_monitoring_type
  max_pods                    = var.kubernetes_max_monitoring_pods
  max_count                   = var.kubernetes_max_monitoring_instances
  min_count                   = var.kubernetes_min_monitoring_instances
  auto_scaling_enabled        = var.kubernetes_monitoring_enable_auto_scaling
  mode                        = "User"
  os_type                     = "Linux"
  os_disk_size_gb             = var.kubernetes_monitoring_os_disk_size
  os_disk_type                = "Managed"
  node_taints                 = ["vendor=cosmotech:NoSchedule"]
  node_labels                 = { "cosmotech.com/tier" = "monitoring" }
  vnet_subnet_id              = var.subnet_id
  tags                        = local.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  depends_on = [
    azurerm_kubernetes_cluster.phoenixcluster
  ]
}

resource "azurerm_kubernetes_cluster_node_pool" "basic" {
  name                        = "basic"
  kubernetes_cluster_id       = azurerm_kubernetes_cluster.phoenixcluster.id
  temporary_name_for_rotation = substr(var.temporary_name_for_rotation_basic_pool, 0, 12)
  orchestrator_version        = var.kubernetes_version
  vm_size                     = var.kubernetes_basic_compute_type
  max_pods                    = var.kubernetes_max_basic_pods
  max_count                   = var.kubernetes_max_basic_compute_instances
  min_count                   = var.kubernetes_min_basic_compute_instances
  auto_scaling_enabled        = var.kubernetes_basic_enable_auto_scaling
  mode                        = "User"
  os_type                     = "Linux"
  os_disk_size_gb             = var.kubernetes_basic_os_disk_size
  os_disk_type                = "Managed"
  node_taints                 = ["vendor=cosmotech:NoSchedule"]
  node_labels                 = { "cosmotech.com/tier" = "compute", "cosmotech.com/size" = "basic" }
  vnet_subnet_id              = var.subnet_id
  tags                        = local.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  depends_on = [azurerm_kubernetes_cluster_node_pool.monitoring]
}

resource "azurerm_kubernetes_cluster_node_pool" "highcpu" {
  name                        = "highcpu"
  kubernetes_cluster_id       = azurerm_kubernetes_cluster.phoenixcluster.id
  temporary_name_for_rotation = substr(var.temporary_name_for_rotation_highcpu_pool, 0, 12)
  orchestrator_version        = var.kubernetes_version
  vm_size                     = var.kubernetes_highcpu_compute_type
  max_pods                    = var.kubernetes_max_highcpu_pods
  max_count                   = var.kubernetes_max_highcpu_compute_instances
  min_count                   = var.kubernetes_min_highcpu_compute_instances
  auto_scaling_enabled        = var.kubernetes_highcpu_enable_auto_scaling
  mode                        = "User"
  os_type                     = "Linux"
  os_disk_size_gb             = var.kubernetes_highcpu_os_disk_size
  os_disk_type                = "Managed"
  node_taints                 = ["vendor=cosmotech:NoSchedule"]
  node_labels                 = { "cosmotech.com/tier" = "compute", "cosmotech.com/size" = "highcpu" }
  vnet_subnet_id              = var.subnet_id
  tags                        = local.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  depends_on = [
    azurerm_kubernetes_cluster_node_pool.basic
  ]
}

resource "azurerm_kubernetes_cluster_node_pool" "highmemory" {
  name                        = "highmemory"
  kubernetes_cluster_id       = azurerm_kubernetes_cluster.phoenixcluster.id
  temporary_name_for_rotation = substr(var.temporary_name_for_rotation_highmemoty_pool, 0, 12)
  orchestrator_version        = var.kubernetes_version
  vm_size                     = var.kubernetes_highmemory_compute_type
  max_pods                    = var.kubernetes_max_highmemory_pods
  max_count                   = var.kubernetes_max_highmemory_compute_instances
  min_count                   = var.kubernetes_min_highmemory_compute_instances
  auto_scaling_enabled        = var.kubernetes_highmemory_enable_auto_scaling
  mode                        = "User"
  os_type                     = "Linux"
  os_disk_size_gb             = var.kubernetes_highmemory_os_disk_size
  os_disk_type                = "Managed"
  node_taints                 = ["vendor=cosmotech:NoSchedule"]
  node_labels                 = { "cosmotech.com/tier" = "compute", "cosmotech.com/size" = "highmemory" }
  vnet_subnet_id              = var.subnet_id
  tags                        = local.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  depends_on = [
    azurerm_kubernetes_cluster_node_pool.highcpu
  ]
}

resource "azurerm_kubernetes_cluster_node_pool" "tekton" {
  count                       = var.kubernetes_tekton_deploy ? 1 : 0
  name                        = "tekton"
  kubernetes_cluster_id       = azurerm_kubernetes_cluster.phoenixcluster.id
  temporary_name_for_rotation = substr(var.temporary_name_for_rotation_tekton_pool, 0, 12)
  orchestrator_version        = var.kubernetes_version
  vm_size                     = var.kubernetes_tekton_compute_type
  max_pods                    = var.kubernetes_max_tekton_pods
  max_count                   = var.kubernetes_max_tekton_compute_instances
  min_count                   = var.kubernetes_min_tekton_compute_instances
  auto_scaling_enabled        = var.kubernetes_tekton_enable_auto_scaling
  mode                        = "User"
  os_type                     = "Linux"
  os_disk_size_gb             = var.kubernetes_tekton_os_disk_size
  os_disk_type                = "Managed"
  node_taints                 = ["vendor=tekton:NoSchedule"]
  node_labels                 = { "cosmotech.com/tier" = "tekton" }
  vnet_subnet_id              = var.subnet_id
  tags                        = local.tags
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "services" {
  name                        = "services"
  kubernetes_cluster_id       = azurerm_kubernetes_cluster.phoenixcluster.id
  temporary_name_for_rotation = substr(var.temporary_name_for_rotation_services_pool, 0, 12)
  orchestrator_version        = var.kubernetes_version
  vm_size                     = var.kubernetes_services_type
  max_pods                    = var.kubernetes_max_services_pods
  max_count                   = var.kubernetes_max_services_instances
  min_count                   = var.kubernetes_min_services_instances
  auto_scaling_enabled        = var.kubernetes_services_enable_auto_scaling
  mode                        = "User"
  os_type                     = "Linux"
  os_disk_size_gb             = var.kubernetes_services_os_disk_size
  os_disk_type                = "Managed"
  node_taints                 = ["vendor=cosmotech:NoSchedule"]
  node_labels                 = { "cosmotech.com/tier" = "services" }
  vnet_subnet_id              = var.subnet_id
  tags                        = local.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  depends_on = [
    azurerm_kubernetes_cluster_node_pool.highmemory
  ]
}

resource "azurerm_kubernetes_cluster_node_pool" "db" {
  name                        = "db"
  kubernetes_cluster_id       = azurerm_kubernetes_cluster.phoenixcluster.id
  temporary_name_for_rotation = substr(var.temporary_name_for_rotation_db_pool, 0, 12)
  orchestrator_version        = var.kubernetes_version
  vm_size                     = var.kubernetes_db_type
  max_pods                    = var.kubernetes_max_db_pods
  max_count                   = var.kubernetes_max_db_instances
  min_count                   = var.kubernetes_min_db_instances
  auto_scaling_enabled        = var.kubernetes_db_enable_auto_scaling
  mode                        = "User"
  os_type                     = "Linux"
  os_disk_size_gb             = var.kubernetes_db_os_disk_size
  os_disk_type                = "Managed"
  node_taints                 = ["vendor=cosmotech:NoSchedule"]
  node_labels                 = { "cosmotech.com/tier" = "db" }
  vnet_subnet_id              = var.subnet_id
  tags                        = local.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  depends_on = [
    azurerm_kubernetes_cluster_node_pool.services
  ]
}

resource "kubernetes_secret" "network_client_secret" {
  metadata {
    name      = "network-client-secret"
    namespace = "default"
  }

  data = {
    client_id = var.network_clientid
    password  = var.network_clientsecret
  }

  type       = "Opaque"
  depends_on = [azurerm_kubernetes_cluster.phoenixcluster]
}
