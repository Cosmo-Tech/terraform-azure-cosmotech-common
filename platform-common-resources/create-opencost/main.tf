
terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

resource "kubernetes_namespace" "opencost_namespace" {
  metadata {
    name = "opencost"
  }
}

resource "kubectl_manifest" "service_account" {
  validate_schema = false
  yaml_body       = file("${path.module}/opencost-serviceaccount.yaml")

  depends_on = [kubernetes_namespace.opencost_namespace]
}

resource "kubectl_manifest" "cluster_role" {
  validate_schema = false
  yaml_body       = file("${path.module}/opencost-clusterrole.yaml")

  depends_on = [kubectl_manifest.service_account]
}

resource "kubectl_manifest" "cluster_role_binding" {
  validate_schema = false
  yaml_body       = file("${path.module}/opencost-clusterrolebinding.yaml")

  depends_on = [kubectl_manifest.cluster_role]
}

resource "kubectl_manifest" "deployment" {
  validate_schema = false
  yaml_body       = file("${path.module}/opencost-deployment.yaml")

  depends_on = [kubectl_manifest.cluster_role_binding]
}

resource "kubectl_manifest" "service" {
  validate_schema = false
  yaml_body       = file("${path.module}/opencost-service.yaml")

  depends_on = [kubectl_manifest.deployment]
}