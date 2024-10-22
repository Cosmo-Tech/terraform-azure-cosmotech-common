variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
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
}

variable "solidarity_day" {
  description = "The date of the solidarity day (format: DD-MM)"
  type        = string
}

variable "adx_clusters_config" {
  description = "JSON configuration for ADX clusters, format : [{\"cluster_name\": \"cluster1\", \"resource_group\": \"group1\"}]"
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
  validation {
    condition     = var.stop_minutes >= 0 && var.stop_minutes < 60
    error_message = "Minutes must be between 0 and 59"
  }
}

variable "stop_hours" {
  type = number
  validation {
    condition     = var.stop_hours >= 0 && var.stop_hours < 24
    error_message = "Hours must be between 0 and 23"
  }
}

variable "start_minutes" {
  type = number
  validation {
    condition     = var.start_minutes >= 0 && var.start_minutes < 60
    error_message = "Minutes must be between 0 and 59"
  }
}

variable "start_hours" {
  type = number
  validation {
    condition     = var.start_hours >= 0 && var.start_hours < 24
    error_message = "Hours must be between 0 and 23"
  }
}
