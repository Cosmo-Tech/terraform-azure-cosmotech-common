variable "network_sp_client_id" {
  type = string
}

variable "network_sp_client_secret" {
  type = string
}

variable "network_sp_object_id" {
  type = string
}

variable "network_fqdn" {
  type = string
}

variable "network_name" {
  type = string
}

variable "network_new" {
  type = string
}

variable "network_resource_group" {
  type = string
}

variable "network_virtual_address_prefix" {
  description = "The Virtual Network IP range. Minimum /26 NetMaskLength"
  type        = string
}
variable "network_virtual_subnet_address_prefix" {
  type = string
}

variable "network_subnet_name" {
  type = string
}

variable "network_subnet_id" {
  type = string
}

variable "network_private_dns_name_blob" {
  type = string
}

variable "network_private_dns_name_queue" {
  type = string
}
variable "network_private_dns_name_table" {
  type = string
}
variable "network_private_dns_name_eventhub" {
  type = string
}
variable "network_private_dns_name_adt" {
  type = string
}

variable "network_dns_record" {
  description = "The DNS zone name to create platform subdomain. Example: myplatform"
  type        = string
}

variable "network_identifier_uri" {
  description = "The platform identifier uri"
  type        = string
}

variable "network_publicip_id" {
  type = string
}
