variable "pv_prometheus_storage_gbi" {
  type = number
}
variable "pv_prometheus_storage_account_type" {
  type = string
}
variable "pv_prometheus_storage_class_name" {
  type = string
}
variable "pv_prometheus_provider" {
  type = string
}
variable "pv_prometheus_deploy" {
  type = bool
}
variable "pv_prometheus_disk_deploy" {
  type = bool
}
variable "pv_prometheus_disk_source_existing" {
  type = bool
}