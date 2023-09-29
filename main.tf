locals {
  cluster_name   = var.cluster_name != "" ? var.cluster_name : "${var.dns_record}${random_string.cluster_id.result}"
  resource_group = var.resource_group != "" ? var.resource_group : var.dns_record
  # kube_config    = module.cosmotech-prerequisites.out_aks_phoenix_config
}

resource "random_string" "cluster_id" {
  length  = 6
  special = false
  upper   = false
}

data "terraform_remote_state" "state" {
  backend = "azurerm"
  config = {
    resource_group_name  = var.tf_resource_group_name
    storage_account_name = var.tf_storage_account_name
    container_name       = var.tf_container_name
    key                  = var.tf_blob_name
    access_key           = var.tf_access_key
  }
}