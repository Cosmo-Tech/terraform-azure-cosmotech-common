variable "location" {
  type = string
}

variable "network_clientid" {
  type = string
}

variable "network_clientsecret" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = "1.26.6"
}

variable "project_stage" {
  description = "The Project stage"
  type        = string
  validation {
    condition = contains([
      "OnBoarding",
      "Dev",
      "QA",
      "IA",
      "EA",
      "Doc",
      "Support",
      "Demo",
      "Prod",
      "PreProd"
    ], var.project_stage)
    error_message = "Stage must be either: OnBoarding, Dev, QA, IA, EA, Demo, Prod, PreProd, Doc, Support."
  }
}

variable "customer_name" {
  description = "The customer name"
  type        = string
}

variable "project_name" {
  description = "The project name"
  type        = string
}

variable "cost_center" {
  type    = string
  default = "NA"
}

# aks variables
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
  type    = number
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
  type    = number
}

variable "kubernetes_max_basic_pods" {
  type    = number
}

variable "kubernetes_max_system_pods" {
  type    = number
}

variable "kubernetes_monitoring_os_disk_size" {
  type    = number
}

variable "kubernetes_db_os_disk_size" {
  type    = number
}

variable "kubernetes_services_os_disk_size" {
  type    = number
}

variable "kubernetes_highmemory_os_disk_size" {
  type    = number
}

variable "kubernetes_highcpu_os_disk_size" {
  type    = number
}

variable "kubernetes_basic_os_disk_size" {
  type    = number
}

variable "kubernetes_system_os_disk_size" {
  type    = number
}

variable "kubernetes_system_enable_auto_scaling" {
  type    = bool
}

variable "kubernetes_basic_enable_auto_scaling" {
  type    = bool
}

variable "kubernetes_highcpu_enable_auto_scaling" {
  type    = bool
}

variable "kubernetes_highmemory_enable_auto_scaling" {
  type    = bool
}

variable "kubernetes_services_enable_auto_scaling" {
  type    = bool
}

variable "kubernetes_db_enable_auto_scaling" {
  type    = bool
}

variable "kubernetes_monitoring_enable_auto_scaling" {
  type    = bool
}

variable "kubernetes_nodepool_system_name" {
  type = string
}