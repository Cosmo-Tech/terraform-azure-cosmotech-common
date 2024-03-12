variable "create_publicip" {
  type = bool
}
variable "customer_name" {
  type = string
}
variable "location" {
  type = string
}
variable "project_name" {
  type = string
}
variable "project_stage" {
  type = string
}
variable "create_dnsrecord" {
  type = bool
}
variable "dns_record" {
  type = string
}
variable "dns_zone_name" {
  type = string
}
variable "dns_zone_rg" {
  type = string
}
variable "cost_center" {
  type = string
}
variable "publicip_resource_group" {
}
variable "network_sp_objectid" {
  type = string
}
variable "platform_client_id" {
  type = string
}