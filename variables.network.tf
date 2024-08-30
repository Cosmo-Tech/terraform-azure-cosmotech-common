variable "network_sp_client_id" {
  type    = string
  default = ""
}

variable "network_sp_client_secret" {
  type    = string
  default = ""
}

variable "fqdn" {
  type    = string
  default = ""
}

variable "publicip_new_or_existing_or_none" {
  type    = string
  default = "new"
}

variable "public_ip_name" {
  type    = string
  default = ""
}

variable "vnet_name" {
  type    = string
  default = ""
}

variable "vnet_new" {
  type    = string
  default = "new"
}

variable "vnet_resource_group" {
  type = string
}

variable "virtual_network_address_prefix" {
  description = "The Virtual Network IP range. Minimum /26 NetMaskLength"
  type        = string
  default     = "10.21.0.0/16"
}
variable "virtual_network_subnet_address_prefix" {
  type    = string
  default = "10.21.0.0/16"
}

variable "subnet_name" {
  type    = string
  default = "default"
}

variable "create_dnsrecord" {
  description = "Create the DNS record"
  type        = bool
  default     = true
}

variable "private_dns_name_blob" {
  type    = string
  default = "privatelink.blob.core.windows.net"
}

variable "private_dns_name_queue" {
  type    = string
  default = "privatelink.queue.core.windows.net"
}
variable "private_dns_name_table" {
  type    = string
  default = "privatelink.table.core.windows.net"
}
variable "private_dns_name_eventhub" {
  type    = string
  default = "privatelink.servicebus.windows.net"
}
variable "private_dns_name_adt" {
  type    = string
  default = "privatelink.digitaltwins.azure.net"
}

# ARM deployment mode
variable "network_sp_object_id" {
  type        = string
  description = "The ID of the existing Network's service principal"
  default     = ""
}

variable "dns_record" {
  description = "The DNS zone name to create platform subdomain. Example: myplatform"
  type        = string
}

variable "dns_zone_name" {
  description = "The DNS zone name to create platform subdomain. Example: api.cosmotech.com"
  type        = string
  default     = "api.cosmotech.com"
}

variable "dns_zone_rg" {
  description = "The DNS zone resource group"
  type        = string
  default     = "phoenix"
}

variable "api_dns_name" {
  type = string
}
