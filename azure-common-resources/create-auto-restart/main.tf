locals {
  storage_account_name           = "${var.storage_account_name}${random_string.func_suffix.result}"
  storage_account_resource_group = var.resource_group_name
  storage_account_access_key     = azurerm_storage_account.sa.primary_access_key
  storage_connection_string      = azurerm_storage_account.sa.primary_connection_string
  function_app_name              = "${var.function_app_name}${random_string.func_suffix.result}"
  app_service_plan_name          = "${var.app_service_plan_name}${random_string.func_suffix.result}"
}

resource "random_string" "func_suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "null_resource" "package_functions" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      #!/bin/sh

      set -e
      set -x

      if ! [ -x "$(command -v zip)" ]; then
        echo "'zip' is not installed. Please install it."
        exit 1
      fi

      dir_tmp="/tmp/terraform-functions"
      file_archive="$dir_tmp/functions.zip"

      rm -rf $dir_tmp
      mkdir -p $dir_tmp/functions
      cp -R ${path.module}/functions $dir_tmp/

      functions_start="$(ls ${path.module}/functions | grep Start)"
      for fstart in $functions_start; do
        # echo $fstart
        sed -i 's|%KEYSCHEDULE%|0 ${var.start_minutes} ${var.start_hours} * * 1-5|' $dir_tmp/functions/$fstart/function.json
      done

      functions_stop="$(ls ${path.module}/functions | grep Stop)"
      for fstop in $functions_stop; do
        # echo $fstop
        sed -i 's|%KEYSCHEDULE%|0 ${var.stop_minutes} ${var.stop_hours} * * 1-5|' $dir_tmp/functions/$fstop/function.json
      done

      cd $dir_tmp/functions
      zip -r "$file_archive" .

      chmod -R 777 $dir_tmp
    EOT
  }
}

resource "azurerm_storage_account" "sa" {
  name                     = local.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "asp" {
  name                = local.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "Y1"
}

# resource "azurerm_application_insights" "app_insights" {
#   name                = "${local.function_app_name}-analytics"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   application_type    = "web"
# }


resource "azurerm_log_analytics_workspace" "app_insights_workspace" {
  name                = "${local.function_app_name}-analytics-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "app_insights" {
  name                = "${local.function_app_name}-analytics"
  location            = var.location
  resource_group_name = var.resource_group_name
  workspace_id        = azurerm_log_analytics_workspace.app_insights_workspace.id
  application_type    = "web"
}

resource "azurerm_linux_function_app" "fa" {
  name                       = local.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = azurerm_service_plan.asp.id
  storage_account_name       = local.storage_account_name
  storage_account_access_key = local.storage_account_access_key

  app_settings = {
    "ENABLE_ORYX_BUILD"                        = "true"
    "SCM_DO_BUILD_DURING_DEPLOYMENT"           = "true"
    "AzureWebJobsStorage"                      = local.storage_connection_string
    "APPINSIGHTS_INSTRUMENTATIONKEY"           = azurerm_application_insights.app_insights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"    = azurerm_application_insights.app_insights.connection_string
    "FUNCTIONS_EXTENSION_VERSION"              = "~4"
    "WEBSITE_CONTENTAZUREFILECONNECTIONSTRING" = local.storage_connection_string
    "WEBSITE_CONTENTSHARE"                     = lower(local.function_app_name)
    "FUNCTIONS_WORKER_RUNTIME"                 = "python"
    "HOLIDAY_COUNTRY"                          = var.holiday_country
    "SOLIDARITY_DAY"                           = var.solidarity_day
    "AZURE_SUBSCRIPTION_ID"                    = var.subscription_id
    "AZURE_TENANT_ID"                          = var.tenant_id
    "AZURE_CLIENT_ID"                          = var.client_id
    "AZURE_CLIENT_SECRET"                      = var.client_secret
    "ADX_CLUSTERS_CONFIG"                      = var.adx_clusters_config
    "AKS_RESOURCE_GROUP"                       = var.aks_resource_group
    "AKS_CLUSTER_NAME"                         = var.aks_cluster_name
    "POWERBI_RESOURCE_GROUP"                   = var.powerbi_resource_group
    "POWERBI_NAME"                             = var.powerbi_name
    "VM_RESOURCE_GROUP"                        = var.vm_resource_group
    "VM_NAME"                                  = var.vm_name
    "AzureWebJobs.ResumePowerBI.Disabled"      = "0"
    "AzureWebJobs.StartStudioVM.Disabled"      = "0"
    "AzureWebJobs.StopAdxCluster.Disabled"     = "0"
    "AzureWebJobs.StopAks.Disabled"            = "0"
    "AzureWebJobs.StopBowerBI.Disabled"        = "0"
    "AzureWebJobs.StopStudioVM.Disabled"       = "0"
  }

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }

  zip_deploy_file = "/tmp/terraform-functions/functions.zip"

  depends_on = [null_resource.package_functions]
}
