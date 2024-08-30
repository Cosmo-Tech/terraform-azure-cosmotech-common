variable "client_id" {
  description = "The client id"
}

variable "client_secret" {
  description = "The client secret"
}

variable "subscription_id" {
  description = "The subscription id"
}

variable "tenant_id" {
  description = "The tenant id"
}

variable "location" {
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
  type    = string
}

variable "platform_url" {
  description = "The platform url"
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

variable "api_version_path" {
  description = "The API version path"
  type        = string
}

variable "create_publicip" {
  description = "Create the public IP for the platform"
  type        = bool
}

variable "create_dnsrecord" {
  description = "Create the DNS record"
  type        = bool
}

variable "publicip_resource_group" {
  type = string
}

variable "project_stage" {
  description = "The platform stage"
  validation {
    condition = contains([
      "OnBoarding",
      "Dev",
      "QA",
      "IA",
      "EA",
      "Demo",
      "Prod"
    ], var.project_stage)
    error_message = "Stage must be either: OnBoarding, Dev, QA, IA, EA, Demo, Prod."
  }
}

variable "project_name" {
  description = "The project name"
}

variable "customer_name" {
  description = "The customer name"
}

variable "dns_record" {
  description = "The DNS zone name to create platform subdomain. Example: myplatform"
  type        = string
}

variable "dns_zone_name" {
  description = "The DNS zone name to create platform subdomain. Example: api.cosmotech.com"
  type        = string
}

variable "dns_zone_rg" {
  description = "The DNS zone resource group"
  type        = string
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

variable "vnet_name" {
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
  type    = string
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


variable "user_app_role" {
  type = list(object({
    description  = string
    display_name = string
    id           = string
    role_value   = string
  }))
  description = "App role for azuread_application"
}

variable "create_secrets" {
  type    = bool
}

variable "create_babylon" {
  description = "Create the Azure Active Directory Application for Babylon"
  type        = bool
}

variable "cost_center" {
  type    = string
}

variable "tenant_name" {
  type    = string
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