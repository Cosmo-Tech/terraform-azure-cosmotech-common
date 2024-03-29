variable "client_id" {
  type        = string
  description = "The client id of the app registration used to build this"
  default     = ""
}

variable "client_secret" {
  type        = string
  description = "The client secret of the app registration used to build this"
  default     = ""
}

variable "subscription_id" {
  type        = string
  description = "The subscription id"
}

variable "tenant_id" {
  type        = string
  description = "The tenant id"
}

variable "cluster_issuer_email" {
  type = string
}

variable "cluster_issuer_name" {
  type    = string
  default = "letsencrypt-prod"
}

variable "tls_secret_name" {
  type    = string
  default = "letsencrypt-prod"
}

variable "tls_certificate_type" {
  type = string
}

variable "namespace" {
  type = string
}

variable "monitoring_namespace" {
  type    = string
  default = "cosmotech-monitoring"
}

variable "ingress_nginx_version" {
  type = string
}

variable "create_prometheus_stack" {
  type = bool
}

variable "publicip_resource_group" {
  type = string
}

variable "api_dns_name" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "loadbalancer_ip" {
  type = string
}

variable "kube_config" {
}

variable "certificate_cert_content" {
}

variable "certificate_key_content" {
}