module "deploy-config-keycloak" {
  source = "./config-keycloak"

  count = var.keycloak_config_deploy ? 1 : 0

  keycloak_admin_password          = var.keycloak_admin_password
  keycloak_admin_user              = var.keycloak_admin_user
  keycloak_postgres_admin_password = var.keycloak_postgres_admin_password
  keycloak_postgres_password       = var.keycloak_postgres_password
  keycloak_postgres_user           = var.keycloak_postgres_user
  keycloak_namespace               = var.keycloak_namespace
}