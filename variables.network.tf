variable "network_sp_client_id" {
  type    = string
  default = ""
}

variable "network_sp_client_secret" {
  type    = string
  default = ""
}

variable "network_fqdn" {
  type    = string
  default = ""
}

variable "publicip_new_or_existing_or_none" {
  type    = string
  default = "new"
}

variable "network_publicip_name" {
  type    = string
  default = ""
}

variable "network_name" {
  type    = string
  default = ""
}

variable "network_new" {
  type    = string
  default = "new"
}

variable "network_resource_group" {
  type = string
}

variable "network_virtual_address_prefix" {
  description = "The Virtual Network IP range. Minimum /26 NetMaskLength"
  type        = string
  default     = "10.21.0.0/24"
}
variable "network_virtual_subnet_address_prefix" {
  type    = string
  default = "10.21.0.0/24"
}

variable "network_subnet_name" {
  type    = string
  default = "default"
}

variable "network_dns_record_create" {
  description = "Create the DNS record"
  type        = bool
  default     = true
}

variable "network_private_dns_name_blob" {
  type    = string
  default = "privatelink.blob.core.windows.net"
}

variable "network_private_dns_name_queue" {
  type    = string
  default = "privatelink.queue.core.windows.net"
}
variable "network_private_dns_name_table" {
  type    = string
  default = "privatelink.table.core.windows.net"
}
variable "network_private_dns_name_eventhub" {
  type    = string
  default = "privatelink.servicebus.windows.net"
}
variable "network_private_dns_name_adt" {
  type    = string
  default = "privatelink.digitaltwins.azure.net"
}

# ARM deployment mode
variable "network_sp_object_id" {
  type        = string
  description = "The ID of the existing Network's service principal"
  default     = ""
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
  default     = "phoenix"
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
  default     = ""
}