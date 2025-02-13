output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.phoenixcluster.name
}

output "aks_cluster_config" {
  value     = azurerm_kubernetes_cluster.phoenixcluster.kube_admin_config
  sensitive = true
}

output "aks_cluster_resource_group_managed" {
  value = azurerm_kubernetes_cluster.phoenixcluster.node_resource_group
}
