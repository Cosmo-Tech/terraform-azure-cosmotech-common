variable "is_bare_metal" {
  type = bool
}

variable "kubernetes_resource_group" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "kubernetes_cluster_name" {
  type = string
}

variable "temporary_name_for_rotation_system_pool" {
  type = string
}

variable "kubernetes_azurefile_storage_class_sku" {
  type = string
}

variable "kubernetes_azurefile_storage_tags" {
  type = string
}

variable "kubernetes_network_plugin" {
  type = string
}

variable "kubernetes_nodepool_system_type" {
  type = string
}

variable "kubernetes_basic_compute_type" {
  type = string
}

variable "kubernetes_highcpu_compute_type" {
  type = string
}

variable "kubernetes_highmemory_compute_type" {
  type = string
}

variable "kubernetes_monitoring_type" {
  type = string
}

variable "kubernetes_services_type" {
  type = string
}

variable "kubernetes_db_type" {
  type = string
}

variable "kubernetes_max_basic_compute_instances" {
  type = number
}

variable "kubernetes_max_highcpu_compute_instances" {
  type = number
}
variable "kubernetes_max_highmemory_compute_instances" {
  type = number
}

variable "kubernetes_max_monitoring_instances" {
  type = number
}

variable "kubernetes_max_services_instances" {
  type = number
}

variable "kubernetes_min_db_instances" {
  type = number
}

variable "kubernetes_max_db_instances" {
  type = number
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

variable "kubernetes_azure_rbac_enabled" {
  type = bool
}

variable "kubernetes_admin_group_object_ids" {
  type = list(string)
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

variable "kubernetes_azure_rbac_enabled" {
  type = bool
}

variable "kubernetes_admin_group_object_ids" {
  type = list(string)
}

variable "kubernetes_tekton_deploy" {
  type = bool
}
