variable "create_vault_secrets_operator" {
  type = bool
}

variable "vault_secrets_operator_namespace" {
  type    = string
  default = "vault-secrets-operator"
}

variable "vault_secrets_operator_helm_repo_url" {
  type = string
}

variable "vault_secrets_operator_helm_chart" {
  type = string
}

variable "vault_secrets_operator_helm_chart_version" {
  type = string
}

variable "vault_secrets_operator_helm_release_name" {
  type = string
}

variable "vault_secrets_operator_vault_address" {
  type    = string
  default = "http://vault.vault.svc.cluster.local:8200"
}

variable "vault_secrets_operator_allowed_namespaces" {
  type        = list(string)
  description = "List of namespaces allowed to access secrets"
}

variable "vault_secrets_operator_replicas" {
  type = number
}

variable "organization" {
  type = string
}

variable "organization_id" {
  type = string
}

variable "workspace_key" {
  type = string
}