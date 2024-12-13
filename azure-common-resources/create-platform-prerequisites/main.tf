locals {
  pre_name       = "Cosmo Tech "
  post_name      = " ${var.customer_name} For ${var.project_stage} ${var.project_name}"
  tags = {
    vendor      = "cosmotech"
    stage       = var.project_stage
    customer    = var.customer_name
    project     = var.project_name
    cost_center = var.cost_center
  }
  tags_app = [
    "HideApp",
    "WindowsAzureActiveDirectoryIntegratedApp",
    var.project_stage,
    var.customer_name,
    var.project_name,
    "terraformed"
  ]
}

data "azuread_users" "owners" {
  user_principal_names = var.owner_list
}

resource "azuread_application" "network_app" {
  display_name     = "${local.pre_name}Network${local.post_name}"
  logo_image       = filebase64(var.image_path)
  owners           = data.azuread_users.owners.object_ids
  sign_in_audience = "AzureADMyOrg"
  tags             = local.tags_app
}

resource "azuread_service_principal" "network_app" {
  client_id                    = azuread_application.network_app.client_id
  app_role_assignment_required = false
  tags                         = local.tags_app
}

resource "azuread_application_password" "network_app_password" {
  display_name      = "network_secret"
  application_id    = azuread_application.network_app.id
}

# Resource group
resource "azurerm_resource_group" "platform_rg" {
  name     = var.resource_group
  location = var.location
  tags     = local.tags
}
