variable "namespace" {
  type = string
}

variable "helm_repo_url" {
  type    = string
}

variable "helm_chart" {
  type    = string
}

variable "helm_chart_version" {
  type    = string
}

variable "helm_release_name" {
  type    = string
}

variable "vault_replicas" {
    type = number
}

variable "vault_secret_name" {
  type = string
}

variable "vault_ingress_enabled" {
  type = bool
}

# variable "tls_secret_name" {
#   type = string
# }

variable "vault_dns_name" {
  type = string
}