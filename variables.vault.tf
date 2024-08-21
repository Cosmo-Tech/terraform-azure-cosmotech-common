variable "create_vault" {
  type = bool
}

variable "vault_namespace" {
  type    = string
  default = "vault"
}

variable "vault_helm_repo_url" {
  type = string
}

variable "vault_helm_chart" {
  type = string
}

variable "vault_helm_chart_version" {
  type = string
}

variable "vault_helm_release_name" {
  type = string
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