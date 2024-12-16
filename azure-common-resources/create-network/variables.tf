variable "resource_group" {
  type = string
}

variable "vnet_iprange" {
  type = string
}

variable "project_stage" {
  description = "The platform stage"
  type = string
}

variable "customer_name" {
  type        = string
  description = "The customer name"
}

variable "project_name" {
  type        = string
  description = "The project name"
}

variable "location" {
  type        = string
  description = "The Azure location"
}

variable "cost_center" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "network_name" {
  type    = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_iprange" {
  type = string
}

variable "vnet_resource_group" {
  type = string
}

variable "network_publicip_id" {
  type = string
}

variable "network_sp_objectid" {
  type = string
}