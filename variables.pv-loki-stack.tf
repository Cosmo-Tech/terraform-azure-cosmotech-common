variable "pv_loki_stack_deploy" {
  type = bool
}
variable "pv_loki_disk_deploy" {
  type = bool
}
variable "pv_loki_disk_source_existing" {
  type = bool
}
variable "pv_loki_storage_gbi" {
  type = number
}
variable "pv_loki_storage_account_type" {
  type = string
}
variable "pv_loki_storage_class_name" {
  type = string
}
variable "pv_loki_provider" {
  type = string
}
variable "pv_grafana_disk_deploy" {
  type = bool
}
variable "pv_grafana_disk_source_existing" {
  type = bool
}
variable "pv_grafana_storage_gbi" {
  type = number
}
variable "pv_grafana_storage_account_type" {
  type = string
}
variable "pv_grafana_storage_class_name" {
  type = string
}
variable "pv_grafana_provider" {
  type = string
}
