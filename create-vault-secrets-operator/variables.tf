variable "namespace" {
  type = string
}

variable "vault_namespace" {
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

variable "vault_address" {
  type = string
}

variable "allowed_namespaces" {
  type        = list(string)
  description = "List of namespaces allowed to access secrets"
}

variable "replicas" {
  type = number
}

variable "cluster_name" {
  type    = string
  default = ""
}

variable "tenant_id" {
  type = string
}

variable "organization" {
  type = string
}
