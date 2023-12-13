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

variable "client_id" {
  type        = string
  description = "The client id of the app registration used to build this"
  default     = ""
}

# variable "platform_sp_client_id" {
#   type        = string
#   description = "The client_id of the platform's service principal"
# }

variable "client_secret" {
  type        = string
  description = "The client secret of the app registration used to build this"
  default     = ""
}

# variable "platform_sp_client_secret" {
#   type        = string
#   description = "The client_secret of the platform's service principal"
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

# variable "network_adt_clientid" {
#   type = string
# }

# variable "network_adt_password" {
#   type = string
# }

variable "kube_config" {
}

variable "create_prometheus_stack" {
  type    = bool
  default = true
}

variable "opencost_object_id" {
  type = string
}

variable "opencost_password" {
  type = string
}

variable "azure_offer_id" {
  type = string
}