variable "cert_manager_namespace" {
  type    = string
  default = "cert-manager"
}

variable "cert_manager_helm_repo_url" {
  type    = string
  default = "https://charts.jetstack.io"
}

variable "cert_manager_helm_release_name" {
  type    = string
  default = "cert-manager"
}

variable "cert_manager_version" {
  type        = string
  description = "HELM Chart Version for cert-manager"
  default     = "1.11.0"
}

variable "cluster_issuer_server" {
  description = "The ACME server URL"
  type        = string
  default     = "https://acme-v02.api.letsencrypt.org/directory"
}

variable "tls_secret_name" {
  type    = string
  default = "letsencrypt-prod"
}

variable "cluster_issuer_email" {
  type    = string
  default = "platform@cosmotech.com"
}

variable "cluster_issuer_name" {
  type    = string
  default = "letsencrypt-prod"
}

variable "tls_certificate_type" {
  type    = string
  default = "let_s_encrypt"
  validation {
    condition = contains([
      "let_s_encrypt",
      "custom",
      "none"
    ], var.tls_certificate_type)
    error_message = "Only let_s_encrypt and none are supported for tls_certificate_type."
  }
}

variable "tls_certificate_custom_certificate" {
  type    = string
  default = ""
}

variable "tls_certificate_custom_key" {
  type    = string
  default = ""
}