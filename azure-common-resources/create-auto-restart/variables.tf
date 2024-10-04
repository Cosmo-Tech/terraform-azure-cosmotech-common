variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
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

variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "The Azure Tenant ID"
  type        = string
}

variable "client_id" {
  description = "The Azure Client ID (Service Principal ID)"
  type        = string
}

variable "client_secret" {
  description = "The Azure Client Secret (Service Principal Secret)"
  type        = string
  sensitive   = true
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
