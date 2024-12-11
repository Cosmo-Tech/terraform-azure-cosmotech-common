output "client_certificate" {
  value     = azurerm_kubernetes_cluster.phoenixcluster.kube_config.0.client_certificate
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

output "resource_group_managed_cluster" {
  value = azurerm_kubernetes_cluster.phoenixcluster.node_resource_group
}