variable "ingress_nginx_version" {
  type = string
}

variable "ingress_nginx_helm_repo_url" {
  type = string
}

variable "ingress_nginx_helm_release_name" {
  type = string
}

variable "ingress_nginx_namespace" {
  type = string
}

variable "publicip_address" {
  type = string
}

variable "publicip_resource_group" {
  type = string
}

variable "ingress_nginx_replica_count" {
  type = number
}