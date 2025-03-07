module "deploy-persistence-keycloak" {
  source = "./persistence-postgres-keycloak"

  count = var.pv_keycloak_postgres_deploy ? 1 : 0

  kubernetes_mc_resource_group_name         = module.create-cluster.aks_cluster_resource_group_managed
  location                                  = var.location
  pv_keycloak_disk_deploy                   = var.pv_keycloak_disk_deploy
  pv_keycloak_disk_source_existing          = var.pv_keycloak_disk_source_existing
  pv_keycloak_postgres_provider             = var.pv_keycloak_postgres_provider
  pv_keycloak_postgres_storage_account_type = var.pv_keycloak_postgres_storage_account_type
  pv_keycloak_postgres_storage_class_name   = var.pv_keycloak_postgres_storage_class_name
  pv_keycloak_postgres_storage_gbi          = var.pv_keycloak_postgres_storage_gbi

  depends_on = [module.create-cluster]
}