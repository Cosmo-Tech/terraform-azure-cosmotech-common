variable "is_bare_metal" {
  type = bool
}

variable "api_version_path" {
  description = "The API version path"
  type        = string
  default     = "/"
}

variable "kubernetes_version" {
  type    = string
  default = "1.27.7"
}

variable "cluster_name" {
  type = string
}

variable "namespace" {
  type    = string
  default = "phoenix"
}

variable "monitoring_namespace" {
  type    = string
  default = "cosmotech-monitoring"
}

variable "temporary_name_for_rotation_system_pool" {
  type    = string
  default = "systemrotation"
}

variable "kubernetes_azurefile_storage_class_sku" {
  type    = string
  default = "Premium_LRS"
}

variable "kubernetes_azurefile_storage_tags" {
  type    = string
  default = ""
}

variable "kubernetes_network_plugin" {
  type    = string
  default = "azure"
}

variable "kubernetes_nodepool_system_type" {
  type    = string
  default = "Standard_A2_v2"
}

variable "kubernetes_basic_compute_type" {
  type    = string
  default = "Standard_F4s_v2"
}

variable "kubernetes_highcpu_compute_type" {
  type    = string
  default = "Standard_F72s_v2"
}

variable "kubernetes_highmemory_compute_type" {
  type    = string
  default = "Standard_E16ads_v5"
}

variable "kubernetes_monitoring_type" {
  type    = string
  default = "Standard_D2ads_v5"
}

variable "kubernetes_services_type" {
  type    = string
  default = "Standard_B4ms"
}

variable "kubernetes_db_type" {
  type    = string
  default = "Standard_D2ads_v5"
}

variable "kubernetes_max_basic_compute_instances" {
  type    = number
  default = 5
}

variable "kubernetes_max_highcpu_compute_instances" {
  type    = number
  default = 2
}
variable "kubernetes_max_highmemory_compute_instances" {
  type    = number
  default = 3
}

variable "kubernetes_max_monitoring_instances" {
  type    = number
  default = 10
}

variable "kubernetes_max_services_instances" {
  type    = number
  default = 5
}

variable "kubernetes_min_db_instances" {
  type    = number
  default = 2
}

variable "kubernetes_max_db_instances" {
  type    = number
  default = 6
}

variable "kubernetes_min_monitoring_instances" {
  type    = number
  default = 1
}

variable "kubernetes_min_services_instances" {
  type    = number
  default = 2
}

variable "kubernetes_min_highmemory_compute_instances" {
  type    = number
  default = 0
}

variable "kubernetes_min_highcpu_compute_instances" {
  type    = number
  default = 0
}

variable "kubernetes_min_basic_compute_instances" {
  type    = number
  default = 1
}

variable "kubernetes_min_system_instances" {
  type    = number
  default = 3
}

variable "kubernetes_max_system_instances" {
  type    = number
  default = 6
}

variable "kubernetes_max_monitoring_pods" {
  type    = number
  default = 110
}

variable "kubernetes_max_db_pods" {
  type    = number
  default = 110
}

variable "kubernetes_max_services_pods" {
  type    = number
  default = 110
}

variable "kubernetes_max_highmemory_pods" {
  type    = number
  default = 110
}

variable "kubernetes_max_highcpu_pods" {
  type    = number
  default = 110
}

variable "kubernetes_max_basic_pods" {
  type    = number
  default = 110
}

variable "kubernetes_max_system_pods" {
  type    = number
  default = 110
}

variable "kubernetes_monitoring_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_db_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_services_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_highmemory_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_highcpu_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_basic_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_system_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_system_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_basic_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_highcpu_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_highmemory_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_services_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_db_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_monitoring_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_nodepool_system_name" {
  type    = string
  default = "system"
}