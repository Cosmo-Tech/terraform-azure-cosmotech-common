terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
  }
}

locals {
  values_vault_secrets_operator = {
    "NAMESPACE"             = var.namespace
    }
  instance_name = "${var.helm_release_name}"
}

resource "kubernetes_namespace" "vault_secrets_operator_namespace" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "vault_secrets_operator" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.helm_chart_version
  namespace  = var.namespace

  reuse_values = true
  timeout      = 600


  set {
    name  = "vault.address"
    value = var.vault_address
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = kubernetes_service_account.vault_secrets_operator.metadata[0].name
  }

  values = [
    templatefile("${path.module}/values.yaml", local.values_vault_secrets_operator)
  ]
}

# RBACs

resource "kubernetes_cluster_role" "vault_secrets_operator" {
  metadata {
    name = "vault-secrets-operator-role"
  }

  rule {
    api_groups = [""]
    resources  = ["secrets"]
    verbs      = ["*"]
  }

  rule {
    api_groups = ["vault.hashicorp.com"]
    resources  = ["vaultsecrets"]
    verbs      = ["*"]
  }

  rule {
    api_groups = [""]
    resources  = ["serviceaccounts", "namespaces"]
    verbs      = ["get", "list", "watch"]
  }

  rule {
    api_groups = ["authentication.k8s.io"]
    resources  = ["tokenreviews"]
    verbs      = ["create"]
  }
}

resource "kubernetes_cluster_role_binding" "vault_secrets_operator" {
  metadata {
    name = "vault-secrets-operator-rolebinding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.vault_secrets_operator.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.vault_secrets_operator.metadata[0].name
    namespace = var.namespace
  }
}

# Authorize vault access
resource "kubernetes_role" "vault_auth" {
  metadata {
    name      = "vault-auth"
    namespace = "vault"
  }

  rule {
    api_groups = [""]
    resources  = ["serviceaccounts"]
    verbs      = ["get"]
  }
}

resource "kubernetes_role_binding" "vault_auth" {
  metadata {
    name      = "vault-auth"
    namespace = "vault"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.vault_auth.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = "vault-secrets-operator"
    namespace = "vault-secrets-operator"
  }
}

# Restrict secrets access by namespace
resource "kubernetes_role" "secret_access" {
  for_each = toset(var.allowed_namespaces)

  metadata {
    name      = "secret-access-${each.key}"
    namespace = each.key
  }

  rule {
    api_groups = [""]
    resources  = ["secrets"]
    verbs      = ["get", "list", "watch", "create", "update", "delete"]
  }

  rule {
    api_groups = ["secrets.hashicorp.com"]
    resources  = ["vaultsecrets"]
    verbs      = ["get", "list", "watch", "create", "update", "delete"]
  }
}

resource "kubernetes_role" "operator_access" {
  for_each = toset(var.allowed_namespaces)

  metadata {
    name      = "vault-secrets-operator-access-${each.key}"
    namespace = each.key
  }

  rule {
    api_groups = [""]
    resources  = ["secrets"]
    verbs      = ["get", "list", "watch", "create", "update", "delete"]
  }

  rule {
    api_groups = ["secrets.hashicorp.com"]
    resources  = ["vaultsecrets"]
    verbs      = ["get", "list", "watch", "create", "update", "delete"]
  }
}

resource "kubernetes_role_binding" "secret_access" {
  for_each = toset(var.allowed_namespaces)

  metadata {
    name      = "secret-access-binding-${each.key}"
    namespace = each.key
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.secret_access[each.key].metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = each.key
  }
}

resource "kubernetes_role_binding" "operator_access" {
  for_each = toset(var.allowed_namespaces)

  metadata {
    name      = "vault-secrets-operator-access-binding-${each.key}"
    namespace = each.key
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.operator_access[each.key].metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.vault_secrets_operator.metadata[0].name
    namespace = var.namespace
  }
}