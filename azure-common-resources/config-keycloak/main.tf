resource "kubernetes_namespace" "keycloak_namespace" {
  metadata {
    name = var.keycloak_namespace
  }
  timeouts {
    delete = "5m"
  }
}

resource "random_password" "keycloak_admin_password" {
  length  = 30
  special = false
}

resource "random_password" "keycloak_postgres_password" {
  length  = 30
  special = false
}

resource "random_password" "keycloak_postgres_admin_password" {
  length  = 30
  special = false
}

resource "kubernetes_secret" "keycloak_config" {
  metadata {
    name      = "keycloak-config"
    namespace = var.keycloak_namespace
    labels = {
      "app" = "keycloak"
    }
  }

  data = {
    keycloak_admin_user              = var.keycloak_admin_user
    keycloak_admin_password          = var.keycloak_admin_password == "" ? random_password.keycloak_admin_password.result : var.keycloak_admin_password
    keycloak_postgres_user           = var.keycloak_postgres_user
    keycloak_postgres_password       = var.keycloak_postgres_password == "" ? random_password.keycloak_postgres_password.result : var.keycloak_postgres_password
    keycloak_postgres_admin_password = var.keycloak_postgres_admin_password == "" ? random_password.keycloak_postgres_admin_password.result : var.keycloak_postgres_admin_password
  }

  type = "Opaque"
}
