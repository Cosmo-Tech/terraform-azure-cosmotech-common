terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

locals {
  values_cert_manager = {
    "MONITORING_NAMESPACE"                        = var.monitoring_namespace
    "CERT_MANAGER_ACME"                           = var.cluster_issuer_name
    "TLS_CERTIFICATE_LET_S_ENCRYPT_CONTACT_EMAIL" = var.cluster_issuer_email
    "CERT_MANAGER_ACME_SERVER"                    = var.cluster_issuer_server
    "TLS_SECRET_NAME"                             = var.tls_secret_name
    "COSMOTECH_API_DNS_NAME"                      = var.api_dns_name
  }
}

resource "kubernetes_namespace" "monitoring_namespace" {
  metadata {
    name = var.namespace
  }
}

# Here we have three options:
# - none: no certificate / issuer is created
# - custom: a TLS secret is created
# - let_s_encrypt: a TLS secret and a cluster issuer is created and cert-manager is installed
resource "helm_release" "cert-manager" {
  count      = var.tls_certificate_type == "let_s_encrypt" ? 1 : 0
  name       = var.helm_release_name
  repository = var.helm_repo_url
  chart      = var.helm_release_name
  namespace  = var.namespace

  reuse_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_cert_manager)
  ]

  set {
    name  = "installCRDs"
    value = true
  }
}

resource "time_sleep" "wait" {
  create_duration = "300s"

  depends_on = [helm_release.cert-manager]
}

resource "kubectl_manifest" "cluster_issuer" {
  count           = var.tls_certificate_type == "let_s_encrypt" ? 1 : 0
  validate_schema = false
  yaml_body       = templatefile("${path.module}/values-issuer.yaml", local.values_cert_manager)

  depends_on = [helm_release.cert-manager, time_sleep.wait]
}

resource "kubectl_manifest" "certificates" {
  count           = var.tls_certificate_type == "let_s_encrypt" ? 1 : 0
  validate_schema = false
  yaml_body       = templatefile("${path.module}/values-certificate.yaml", local.values_cert_manager)

  depends_on = [kubectl_manifest.cluster_issuer]
}

resource "kubernetes_secret" "tls" {
  count = var.tls_certificate_type == "custom" ? 1 : 0
  metadata {
    name      = var.tls_secret_name
    namespace = var.namespace
  }

  type = "kubernetes.io/tls"

  # This option supposedly needs the two files to be created and located at the root of the module.
  # data = {
  #   "tls.crt" = file("${path.module}/certificate.cert")
  #   "tls.key" = file("${path.module}/certificate_key.key")
  # }
  # This option supposedly needs the vars to be created and passed to this module.
  data = {
    "tls.crt" = var.certificate_cert_content
    "tls.key" = var.certificate_key_content
  }

}

# Experimental: gives helm time to finish cleaning up.
#
# Otherwise, after `terraform destroy`:
# │ Error: uninstallation completed with 1 error(s): uninstall: Failed to purge
#   the release: release: not found
resource "time_sleep" "wait_30_seconds" {
  depends_on = [helm_release.cert-manager]

  destroy_duration = "30s"
}