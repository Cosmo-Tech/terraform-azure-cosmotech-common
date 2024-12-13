# Azure
deployment_type = "Terraform"
audience        = "AzureADMultipleOrgs"
client_id       = ""
client_secret   = ""

# Backend remote
tf_resource_group_name  = ""
tf_storage_account_name = ""
tf_container_name       = ""
tf_blob_name            = ""
tf_access_key           = ""

# Kubernetes
kubernetes_version                          = "1.30.5"
kubernetes_azure_rbac_enabled               = true
temporary_name_for_rotation_system_pool     = "system"
kubernetes_azurefile_storage_class_sku      = "Premium_LRS"
kubernetes_azurefile_storage_tags           = ""
kubernetes_network_plugin                   = "azure"
kubernetes_nodepool_system_type             = "Standard_A2_v2"
kubernetes_basic_compute_type               = "Standard_F4s_v2"
kubernetes_highcpu_compute_type             = "Standard_F72s_v2"
kubernetes_highmemory_compute_type          = "Standard_E16ads_v5"
kubernetes_monitoring_type                  = "Standard_D2ads_v5"
kubernetes_services_type                    = "Standard_B4ms"
kubernetes_db_type                          = "Standard_D2ads_v5"
kubernetes_max_basic_compute_instances      = 5
kubernetes_max_highcpu_compute_instances    = 2
kubernetes_max_highmemory_compute_instances = 3
kubernetes_max_monitoring_instances         = 10
kubernetes_max_services_instances           = 5
kubernetes_min_db_instances                 = 2
kubernetes_max_db_instances                 = 6
kubernetes_min_monitoring_instances         = 1
kubernetes_min_services_instances           = 2
kubernetes_min_highmemory_compute_instances = 0
kubernetes_min_highcpu_compute_instances    = 0
kubernetes_min_basic_compute_instances      = 1
kubernetes_min_system_instances             = 3
kubernetes_max_system_instances             = 6
kubernetes_max_monitoring_pods              = 110
kubernetes_max_db_pods                      = 110
kubernetes_max_services_pods                = 110
kubernetes_max_highmemory_pods              = 110
kubernetes_max_highcpu_pods                 = 110
kubernetes_max_basic_pods                   = 110
kubernetes_max_system_pods                  = 110
kubernetes_monitoring_os_disk_size          = 128
kubernetes_db_os_disk_size                  = 128
kubernetes_services_os_disk_size            = 128
kubernetes_highmemory_os_disk_size          = 128
kubernetes_highcpu_os_disk_size             = 128
kubernetes_basic_os_disk_size               = 128
kubernetes_system_os_disk_size              = 128
kubernetes_system_enable_auto_scaling       = true
kubernetes_basic_enable_auto_scaling        = true
kubernetes_highcpu_enable_auto_scaling      = true
kubernetes_highmemory_enable_auto_scaling   = true
kubernetes_services_enable_auto_scaling     = true
kubernetes_db_enable_auto_scaling           = true
kubernetes_monitoring_enable_auto_scaling   = true
kubernetes_nodepool_system_name             = "system"
kubernetes_admin_group_object_ids = [
  ""
]

# Network
network_sp_client_id                  = ""
network_sp_client_secret              = ""
network_fqdn                          = ""
publicip_new_or_existing_or_none      = "new"
network_publicip_name                 = ""
network_name                          = ""
network_new                           = "new"
network_virtual_address_prefix        = "10.10.0.0/16"
network_virtual_subnet_address_prefix = "10.10.0.0/16"
network_subnet_name                   = "default"
network_dns_record_create             = true
network_private_dns_name_blob         = "privatelink.blob.core.windows.net"
network_private_dns_name_queue        = "privatelink.queue.core.windows.net"
network_private_dns_name_table        = "privatelink.table.core.windows.net"
network_private_dns_name_eventhub     = "privatelink.servicebus.windows.net"
network_private_dns_name_adt          = "privatelink.digitaltwins.azure.net"
network_sp_object_id                  = ""
network_dns_zone_rg                   = "phoenix"
network_identifier_uri                = ""

# Project
project_name          = ""
project_stage         = "Dev"
project_customer_name = "cosmotech"
project_image_path    = "./cosmotech.png"
project_cost_center   = "NA"

# Auto-restart AZ function
auto_start_stop_deploy = false
storage_account_name   = "saautorestart"
app_service_plan_name  = "asp-auto-restart"
function_app_name      = "auto-restart"
holiday_country        = "FR"
solidarity_day         = ""
adx_clusters_config    = ""
powerbi_resource_group = ""
powerbi_name           = ""
vm_resource_group      = ""
vm_name                = ""
stop_minutes           = 0
stop_hours             = 17
start_minutes          = 0
start_hours            = 5

velero_resource_group                = ""
velero_location                      = "francecentral"
velero_storage_tier                  = "Standard"
velero_storage_replication_type      = "LRS"
velero_public_network_access_enabled = false
velero_storage_name                  = "velero"
velero_storage_kind                  = "StorageV2"
velero_storage_csm_ip                = ""
velero_tags = {
  vendor      = "cosmotech"
  cost_center = "NA"
  customer    = ""
  project     = ""
  stage       = "Dev"
}
