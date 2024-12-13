output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.phoenixcluster.name
}

output "aks_cluster_config" {
  value     = azurerm_kubernetes_cluster.phoenixcluster.kube_admin_config
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.phoenixcluster.kube_config_raw
  sensitive = true
}

output "cluster" {
  value = azurerm_kubernetes_cluster.phoenixcluster
}

output "aks_phoenix_config" {
  value     = azurerm_kubernetes_cluster.phoenixcluster.kube_config
  sensitive = true
}

output "aks_cluster_resource_group_managed" {
  value = azurerm_kubernetes_cluster.phoenixcluster.node_resource_group
}