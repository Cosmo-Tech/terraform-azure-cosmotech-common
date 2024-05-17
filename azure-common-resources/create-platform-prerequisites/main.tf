locals {
  pre_name       = "Cosmo Tech "
  post_name      = " ${var.project_stage} For ${var.customer_name} ${var.project_name}"
  subnet_name    = "default"
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
}

data "azuread_users" "owners" {
  user_principal_names = var.owner_list
}

# Azure AD
resource "azuread_application" "platform" {
  display_name     = "${local.pre_name}Platform${local.post_name}"
  identifier_uris  = var.identifier_uri != "" ? [var.identifier_uri] : [local.identifier_uri]
  logo_image       = filebase64(var.image_path)
  owners           = data.azuread_users.owners.object_ids
  sign_in_audience = var.audience

  tags = ["HideApp", "WindowsAzureActiveDirectoryIntegratedApp", var.project_stage, var.customer_name, var.project_name, "terraformed"]

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" # User.Read
      type = "Scope"
    }
  }

  single_page_application {
    redirect_uris = ["${local.platform_url}${var.api_version_path}swagger-ui/oauth2-redirect.html"]
  }

  web {
    implicit_grant {
      access_token_issuance_enabled = true
    }
  }

  api {
    requested_access_token_version = 2
    oauth2_permission_scope {
      admin_consent_description  = "Allow the application to use the Cosmo Tech Platform with user account"
      admin_consent_display_name = "Cosmo Tech Platform Impersonate"
      enabled                    = true
      id                         = "6332363e-bcba-4c4a-a605-c25f23117400"
      type                       = "User"
      user_consent_description   = "Allow the application to use the Cosmo Tech Platform with your account"
      user_consent_display_name  = "Cosmo Tech Platform Usage"
      value                      = "platform"
    }
  }

  dynamic "app_role" {
    for_each = toset(var.user_app_role)
    iterator = app_role

    content {
      allowed_member_types = [
        "User",
        "Application"
      ]
      description  = app_role.value.description
      display_name = app_role.value.display_name
      id           = app_role.value.id
      enabled      = true
      value        = app_role.value.role_value
    }
  }

  lifecycle {
    ignore_changes = [
      owners,
    ]
  }
}

resource "azuread_service_principal" "platform" {
  client_id                    = azuread_application.platform.client_id
  app_role_assignment_required = true

  tags = ["cosmotech", var.project_stage, var.customer_name, var.project_name, "HideApp", "WindowsAzureActiveDirectoryIntegratedApp", "terraformed"]
}

resource "azuread_application_password" "platform_password" {
  display_name      = "platform_secret"
  count             = var.create_secrets ? 1 : 0
  application_id    = azuread_application.platform.id
  end_date_relative = "4464h"
}


resource "azuread_application" "network_adt" {
  display_name     = "${local.pre_name}Network ${local.post_name}"
  logo_image       = filebase64(var.image_path)
  owners           = data.azuread_users.owners.object_ids
  sign_in_audience = "AzureADMyOrg"
  tags             = ["HideApp", "WindowsAzureActiveDirectoryIntegratedApp", var.project_stage, var.customer_name, var.project_name, "terraformed"]
}

resource "azuread_service_principal" "network_adt" {
  client_id                    = azuread_application.network_adt.client_id
  depends_on                   = [azuread_service_principal.platform]
  app_role_assignment_required = false

  tags = ["cosmotech", var.project_stage, var.customer_name, var.project_name, "HideApp", "WindowsAzureActiveDirectoryIntegratedApp", "terraformed"]
}

resource "azuread_application_password" "network_adt_password" {
  display_name      = "network_adt_secret"
  count             = var.create_secrets ? 1 : 0
  application_id    = azuread_application.network_adt.id
  end_date_relative = "4464h"
}

# create the Azure AD resource group
resource "azuread_group" "platform_group" {
  display_name     = "Cosmotech-Platform-${var.customer_name}-${var.project_name}-${var.project_stage}"
  owners           = data.azuread_users.owners.object_ids
  security_enabled = true
  members          = data.azuread_users.owners.object_ids
}

# Resource group
resource "azurerm_resource_group" "platform_rg" {
  name     = var.resource_group
  location = var.location
  tags     = local.tags
}

resource "azurerm_role_assignment" "rg_owner" {
  scope                = azurerm_resource_group.platform_rg.id
  role_definition_name = "Owner"
  principal_id         = azuread_group.platform_group.object_id
}
