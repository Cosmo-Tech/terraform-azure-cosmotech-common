variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "kusto_name" {
  type = string
}

variable "tags" {
  type = object({
    vendor      = string
    stage       = string
    customer    = string
    project     = string
    cost_center = string
  })
}

variable "subnet_id" {
  type = string
}

variable "private_dns_zone_id" {
  type = string
}