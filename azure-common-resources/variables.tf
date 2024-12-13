variable "client_id" {
  type        = string
  description = "The client id"
}

variable "client_secret" {
  type        = string
  description = "The client secret"
}

variable "subscription_id" {
  type        = string
  description = "The subscription id"
}

variable "tenant_id" {
  type        = string
  description = "The tenant id"
}

variable "location" {
  type        = string
  description = "The Azure location"
}

variable "resource_group" {
  description = "Resource group to create which will contain created Azure resources"
  type        = string
}

variable "cluster_name" {
  type = string
}

variable "deployment_type" {
  type = string
}

variable "image_path" {
  type = string
}

variable "identifier_uri" {
  description = "The platform identifier uri"
}

variable "owner_list" {
  description = "List of mail addresses for App Registration owners"
  type        = list(string)
}

variable "audience" {
  description = "The App Registration audience type"
  validation {
    condition = contains([
      "AzureADMyOrg",
      "AzureADMultipleOrgs"
    ], var.audience)
    error_message = "Only AzureADMyOrg and AzureADMultipleOrgs are supported for audience."
  }
}

variable "project_stage" {
  description = "The platform stage"
  type        = string
}

variable "project_name" {
  type        = string
  description = "The project name"
}

variable "customer_name" {
  type        = string
  description = "The customer name"
}

variable "network_sp_client_id" {
  type = string
}

variable "network_sp_client_secret" {
  type = string
}

variable "network_sp_object_id" {
  type        = string
  description = "The ID of the existing Network's service principal"
}

variable "network_name" {
  type = string
}

variable "vnet_new" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "vnet_iprange" {
  type = string
}

variable "subnet_iprange" {
  type = string
}

variable "vnet_resource_group" {
  type = string
}

variable "private_dns_name_blob" {
  type = string
}

variable "private_dns_name_queue" {
  type = string
}

variable "private_dns_name_table" {
  type = string
}

variable "private_dns_name_adt" {
  type = string
}

variable "private_dns_name_eventhub" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "kubernetes_max_db_instances" {
  type = number
}

variable "kubernetes_min_db_instances" {
  type = number
}

variable "kubernetes_max_services_instances" {
  type = number
}

variable "kubernetes_max_monitoring_instances" {
  type = number
}

variable "kubernetes_max_highmemory_compute_instances" {
  type = number
}

variable "kubernetes_max_highcpu_compute_instances" {
  type = number
}

variable "kubernetes_max_basic_compute_instances" {
  type = number
}

variable "kubernetes_db_type" {
  type = string
}

variable "kubernetes_services_type" {
  type = string
}

variable "kubernetes_monitoring_type" {
  type = string
}

variable "kubernetes_highmemory_compute_type" {
  type = string
}

variable "kubernetes_highcpu_compute_type" {
  type = string
}

variable "kubernetes_basic_compute_type" {
  type = string
}

variable "kubernetes_nodepool_system_type" {
  type = string
}

variable "kubernetes_network_plugin" {
  type = string
}

variable "cost_center" {
  type = string
}

variable "temporary_name_for_rotation_system_pool" {
  type = string
}

variable "kubernetes_min_monitoring_instances" {
  type = number
}

variable "kubernetes_min_services_instances" {
  type = number
}

variable "kubernetes_min_highmemory_compute_instances" {
  type = number
}

variable "kubernetes_min_highcpu_compute_instances" {
  type = number
}

variable "kubernetes_min_basic_compute_instances" {
  type = number
}

variable "kubernetes_min_system_instances" {
  type = number
}

variable "kubernetes_max_system_instances" {
  type = number
}

variable "kubernetes_max_monitoring_pods" {
  type = number
}

variable "kubernetes_max_db_pods" {
  type = number
}

variable "kubernetes_max_services_pods" {
  type = number
}

variable "kubernetes_max_highmemory_pods" {
  type = number
}

variable "kubernetes_max_highcpu_pods" {
  type = number
}

variable "kubernetes_max_basic_pods" {
  type = number
}

variable "kubernetes_max_system_pods" {
  type = number
}

variable "kubernetes_monitoring_os_disk_size" {
  type = number
}

variable "kubernetes_db_os_disk_size" {
  type = number
}

variable "kubernetes_services_os_disk_size" {
  type = number
}

variable "kubernetes_highmemory_os_disk_size" {
  type = number
}

variable "kubernetes_highcpu_os_disk_size" {
  type = number
}

variable "kubernetes_basic_os_disk_size" {
  type = number
}

variable "kubernetes_system_os_disk_size" {
  type = number
}

variable "kubernetes_system_enable_auto_scaling" {
  type = bool
}

variable "kubernetes_basic_enable_auto_scaling" {
  type = bool
}

variable "kubernetes_highcpu_enable_auto_scaling" {
  type = bool
}

variable "kubernetes_highmemory_enable_auto_scaling" {
  type = bool
}

variable "kubernetes_services_enable_auto_scaling" {
  type = bool
}

variable "kubernetes_db_enable_auto_scaling" {
  type = bool
}

variable "kubernetes_monitoring_enable_auto_scaling" {
  type = bool
}

variable "kubernetes_nodepool_system_name" {
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "new_resource_group" {
  description = "Whether to create a new resource group"
  type        = bool
  default     = false
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "use_existing_storage_account" {
  description = "Set to true to use an existing storage account, false to create a new one"
  type        = bool
  default     = false
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "function_app_name" {
  description = "The name of the Function App"
  type        = string
}

variable "holiday_country" {
  description = "The country code for holidays"
  type        = string
  default     = "FR"
}

variable "solidarity_day" {
  description = "The date of the solidarity day (format: DD-MM)"
  type        = string
}

variable "adx_clusters_config" {
  description = "JSON configuration for ADX clusters, format : [{\"cluster_name\": \"cluster1\", \"resource_group\": \"group1\"}]"
  type        = string
}

variable "aks_resource_group" {
  description = "The resource group name for AKS"
  type        = string
}

variable "aks_cluster_name" {
  description = "The AKS cluster name"
  type        = string
}

variable "powerbi_resource_group" {
  description = "The resource group name for Power BI"
  type        = string
}

variable "powerbi_name" {
  description = "The Power BI instance name"
  type        = string
}

variable "vm_resource_group" {
  description = "The resource group name for the VM"
  type        = string
}

variable "vm_name" {
  description = "The VM name"
  type        = string
}

variable "auto_start_stop_deploy" {
  type = bool
}

variable "stop_minutes" {
  type = number
}

variable "stop_hours" {
  type = number
}

variable "start_minutes" {
  type = number
}

variable "start_hours" {
  type = number
}

variable "velero_tags" {
  type = object({
    vendor      = string
    stage       = string
    customer    = string
    project     = string
    cost_center = string
  })
}

variable "velero_storage_name" {
  type = string
}

variable "velero_location" {
  type = string
}

variable "velero_resource_group" {
  type = string
}

variable "velero_storage_tier" {
  type = string
}

variable "velero_storage_replication_type" {
  type = string
}

variable "velero_storage_kind" {
  type = string
}

variable "velero_public_network_access_enabled" {
  type = bool
}

variable "velero_storage_csm_ip" {
  type = string
}

variable "kubernetes_azure_rbac_enabled" {
  type = bool
}

variable "kubernetes_admin_group_object_ids" {
  type = list(string)
}

variable "network_publicip_id" {
  type = string
}
variable "kubernetes_tekton_compute_type" {
  type = string
}

variable "kubernetes_max_tekton_pods" {
  type = number
}

variable "kubernetes_max_tekton_compute_instances" {
  type = number
}

variable "kubernetes_min_tekton_compute_instances" {
  type = number
}

variable "kubernetes_tekton_enable_auto_scaling" {
  type = bool
}

variable "kubernetes_tekton_os_disk_size" {
  type = number
}
}
