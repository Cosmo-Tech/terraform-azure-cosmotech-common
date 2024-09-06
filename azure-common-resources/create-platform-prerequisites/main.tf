locals {
  pre_name       = "Cosmo Tech "
  post_name      = " ${var.project_stage} For ${var.customer_name} ${var.project_name}"
  subnet_name    = var.subnet_name
  identifier_uri = "https://${var.dns_record}.${var.dns_zone_name}"
  platform_url   = var.platform_url != "" ? var.platform_url : "https://${var.dns_record}.${var.dns_zone_name}"
  vnet_iprange   = var.vnet_iprange != "" ? var.vnet_iprange : "10.21.0.0/16"
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
  # Azure IDs
  microsoft_graph_resource_access_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph
  user_read_resource_access_id       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" # User.Read
  platform_resource_access_id        = "6332363e-bcba-4c4a-a605-c25f23117400" # platform
}

data "azuread_users" "owners" {
  user_principal_names = var.owner_list
}

resource "azuread_application" "network_app" {
  display_name     = "${local.pre_name}Network ${local.post_name}"
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
  end_date_relative = "4464h"
}

# Resource group
resource "azurerm_resource_group" "platform_rg" {
  name     = var.resource_group
  location = var.location
  tags     = local.tags
}
