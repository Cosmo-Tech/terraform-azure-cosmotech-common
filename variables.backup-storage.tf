variable "velero_tags" {
  type = object({
    vendor      = string
    stage       = string
    customer    = string
    project     = string
    cost_center = string
  })
}

variable "velero_storage_name" {
  type = string
}

variable "velero_location" {
  type = string
}

variable "velero_resource_group" {
  type = string
}

variable "velero_storage_tier" {
  type = string
}

variable "velero_storage_replication_type" {
  type = string
}

variable "velero_storage_kind" {
  type = string
}

variable "velero_public_network_access_enabled" {
  type = bool
}

variable "velero_storage_csm_ip" {
  type = string
}