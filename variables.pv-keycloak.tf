variable "pv_keycloak_postgres_storage_gbi" {
  type = number
}
variable "pv_keycloak_postgres_storage_account_type" {
  type = string
}
variable "pv_keycloak_postgres_storage_class_name" {
  type = string
}
variable "pv_keycloak_postgres_provider" {
  type = string
}
variable "pv_keycloak_postgres_deploy" {
  type = bool
}
variable "pv_keycloak_disk_deploy" {
  type = bool
}
variable "pv_keycloak_disk_source_existing" {
  type = bool
}