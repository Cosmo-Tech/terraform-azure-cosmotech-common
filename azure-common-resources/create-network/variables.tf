variable "resource_group" {
  type = string
}

variable "vnet_iprange" {
  type    = string
  default = "10.21.0.0/16"
}

variable "network_sp_objectid" {
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

variable "customer_name" {
  description = "The customer name"
}

variable "project_name" {
  description = "The project name"
}

variable "location" {
  description = "The Azure location"
  default     = "West Europe"
}

variable "cost_center" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type    = string
  default = "default"
}

variable "subnet_iprange" {
  type    = string
  default = "10.21.0.0/16"
}

variable "vnet_resource_group" {
  type = string
}