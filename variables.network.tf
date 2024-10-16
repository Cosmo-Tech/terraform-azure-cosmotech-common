variable "network_sp_client_id" {
  type    = string
}

variable "network_sp_client_secret" {
  type    = string
}

variable "network_fqdn" {
  type    = string
}

variable "publicip_new_or_existing_or_none" {
  type    = string
}

variable "network_publicip_name" {
  type    = string
}

variable "network_name" {
  type    = string
}

variable "network_new" {
  type    = string
}

variable "network_resource_group" {
  type = string
}

variable "network_virtual_address_prefix" {
  description = "The Virtual Network IP range. Minimum /26 NetMaskLength"
  type        = string
}
variable "network_virtual_subnet_address_prefix" {
  type    = string
}

variable "network_subnet_name" {
  type    = string
}

variable "network_dns_record_create" {
  description = "Create the DNS record"
  type        = bool
}

variable "network_private_dns_name_blob" {
  type    = string
}

variable "network_private_dns_name_queue" {
  type    = string
}
variable "network_private_dns_name_table" {
  type    = string
}
variable "network_private_dns_name_eventhub" {
  type    = string
}
variable "network_private_dns_name_adt" {
  type    = string
}

# ARM deployment mode
variable "network_sp_object_id" {
  type        = string
  description = "The ID of the existing Network's service principal"
}

variable "network_dns_record" {
  description = "The DNS zone name to create platform subdomain. Example: myplatform"
  type        = string
}

variable "network_dns_zone_name" {
  description = "The DNS zone name to create platform subdomain. Example: api.cosmotech.com"
  type        = string
  validation {
    condition     = can(regex("${var.network_dns_zone_name}$", var.network_api_dns_name))
    error_message = "The dns zone match error"
  }
}

variable "network_dns_zone_rg" {
  description = "The DNS zone resource group"
  type        = string
}

variable "network_api_dns_name" {
  type = string
  validation {
    condition     = can(regex("^${var.network_dns_record}\\.", var.network_api_dns_name))
    error_message = "The dns record match error"
  }
}

variable "network_publicip_resource_group" {
  type = string
}

variable "network_identifier_uri" {
  description = "The platform identifier uri"
  type        = string
}
