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