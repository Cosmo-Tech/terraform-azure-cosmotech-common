module "deploy-persistence-loki-stack" {
  source = "./persistence-loki-stack"

  count = var.pv_loki_stack_deploy ? 1 : 0

  kubernetes_mc_resource_group_name = module.create-cluster.aks_cluster_resource_group_managed
  location                          = var.location
  pv_loki_disk_deploy               = var.pv_loki_disk_deploy
  pv_loki_disk_source_existing      = var.pv_loki_disk_source_existing
  pv_loki_provider                  = var.pv_loki_provider
  pv_loki_storage_account_type      = var.pv_loki_storage_account_type
  pv_loki_storage_class_name        = var.pv_loki_storage_class_name
  pv_loki_storage_gbi               = var.pv_loki_storage_gbi
  pv_grafana_disk_deploy            = var.pv_grafana_disk_deploy
  pv_grafana_disk_source_existing   = var.pv_grafana_disk_source_existing
  pv_grafana_provider               = var.pv_grafana_provider
  pv_grafana_storage_account_type   = var.pv_grafana_storage_account_type
  pv_grafana_storage_class_name     = var.pv_grafana_storage_class_name
  pv_grafana_storage_gbi            = var.pv_grafana_storage_gbi

  depends_on = [module.create-cluster]

}