variable "project_stage" {
  description = "The platform stage"
  type = string
}

variable "customer_name" {
  description = "The customer name"
  type        = string
}

variable "project_name" {
  description = "The project name"
  type        = string
}

variable "owner_list" {
  description = "List of mail addresses for App Registration owners"
  type        = list(string)
}

variable "location" {
  description = "The Azure location"
}

variable "resource_group" {
  description = "Resource group to create which will contain created Azure resources"
  type        = string
}

variable "image_path" {
  type    = string
}

variable "cost_center" {
  type    = string
}