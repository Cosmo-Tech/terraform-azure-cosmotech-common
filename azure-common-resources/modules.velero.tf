module "deploy-backup-storage" {
  source = "./deploy-storage-backup"

  tags                          = var.velero_tags
  storage_name                  = var.velero_storage_name
  location                      = var.velero_location
  resource_group                = var.velero_resource_group
  storage_tier                  = var.velero_storage_tier
  storage_replication_type      = var.velero_storage_replication_type
  storage_kind                  = var.velero_storage_kind
  public_network_access_enabled = var.velero_public_network_access_enabled
  storage_csm_ip                = var.velero_storage_csm_ip
  resource_aks_managed          = module.create-cluster.aks_cluster_resource_group_managed
  network_subnet_id             = var.deployment_type == "ARM" ? var.network_subnet_id : module.create-network.0.out_subnet_id

  depends_on = [module.create-cluster, module.create-network]
}
