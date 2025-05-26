module "deploy-persistence-prometheus" {
  source = "./persistence-prometheus-stack"

  count = var.pv_prometheus_deploy ? 1 : 0

  kubernetes_mc_resource_group_name  = module.create-cluster.aks_cluster_resource_group_managed
  location                           = var.location
  pv_prometheus_disk_source_existing = var.pv_prometheus_disk_source_existing
  pv_prometheus_provider             = var.pv_prometheus_provider
  pv_prometheus_storage_account_type = var.pv_prometheus_storage_account_type
  pv_prometheus_storage_class_name   = var.pv_prometheus_storage_class_name
  pv_prometheus_storage_gbi          = var.pv_prometheus_storage_gbi
  pv_grafana_disk_source_existing   = var.pv_grafana_disk_source_existing
  pv_grafana_provider               = var.pv_grafana_provider
  pv_grafana_storage_account_type   = var.pv_grafana_storage_account_type
  pv_grafana_storage_class_name     = var.pv_grafana_storage_class_name
  pv_grafana_storage_gbi            = var.pv_grafana_storage_gbi

  depends_on = [module.create-cluster]

}