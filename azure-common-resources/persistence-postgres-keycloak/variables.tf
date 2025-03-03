variable "kubernetes_mc_resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
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
