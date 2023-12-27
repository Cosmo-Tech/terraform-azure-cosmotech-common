variable "resource_group" {
  type = string
}

variable "tenant_id" {
  type        = string
  description = "The tenant id"
}

variable "subscription_id" {
  type        = string
  description = "The subscription id"
}

# variable "client_id" {
#   type        = string
#   description = "The client id of the app registration used to build this"
#   default     = ""
# }

# variable "client_secret" {
#   type        = string
#   description = "The client secret of the app registration used to build this"
#   default     = ""
# }

variable "location" {
  type    = string
  default = ""
}

variable "namespace" {
  type = string
}

variable "monitoring_namespace" {
  type    = string
  default = "cosmotech-monitoring"
}

variable "loadbalancer_ip" {
  type = string
}

variable "tls_secret_name" {
  type    = string
  default = "letsencrypt-prod"
}

variable "api_dns_name" {
  type = string
}

variable "cluster_issuer_email" {
  type = string
}

variable "cluster_issuer_name" {
  type    = string
  default = "letsencrypt-prod"
}

variable "ingress_nginx_version" {
  type    = string
  default = "4.2.5"
}

variable "kube_config" {
}

variable "create_prometheus_stack" {
  type    = bool
  default = true
}