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

resource "helm_release" "cert-manager" {
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
  validate_schema = false
  yaml_body       = templatefile("${path.module}/values-issuer.yaml", local.values_cert_manager)

  depends_on = [helm_release.cert-manager, time_sleep.wait]
}

resource "kubectl_manifest" "certificates" {
  validate_schema = false
  yaml_body       = templatefile("${path.module}/values-certificate.yaml", local.values_cert_manager)

  depends_on = [kubectl_manifest.cluster_issuer]
}