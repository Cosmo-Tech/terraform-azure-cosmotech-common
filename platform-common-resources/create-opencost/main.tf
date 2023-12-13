resource "kubernetes_namespace" "opencost_namespace" {
  metadata {
    name = "opencost"
  }
}

# Create Kubernetes Secret
resource "kubernetes_secret" "azure-service-key" {
  metadata {
    name      = "azure-service-key"
    namespace = kubernetes_namespace.opencost_namespace.metadata[0].name
  }
  type = "Opaque"
  data = {
    "azure" = jsonencode({
      "azure" : [
        {
          "subscriptionId" : "${var.subscription_id}",
          "serviceKey" : {
            "appId" : "${var.opencost_object_id}",
            "displayName" : "OpenCostAccess",
            "password" : "${var.opencost_password}",
            "tenant" : "${var.tenant_id}"
          },
        }
      ]
    })
  }
}

locals {
  values_opencost = {
    "AZURE_BILLING_ID" = var.tenant_id
    "AZURE_OFFER_ID"   = var.azure_offer_id
  }
}

resource "helm_release" "opencost" {
  name       = "opencost"
  repository = "https://opencost.github.io/opencost-helm-chart"
  chart      = "opencost"
  namespace  = "opencost"

  values = [
    templatefile("${path.module}/values.yaml", local.values_opencost)
  ]

  set {
    name  = "opencost.prometheus.internal.namespaceName"
    value = var.monitoring_namespace
  }

  set {
    name  = "opencost.metrics.serviceMonitor.namespace"
    value = var.monitoring_namespace
  }
}