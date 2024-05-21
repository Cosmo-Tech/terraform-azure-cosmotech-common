variable "deployment_type" {
  type    = string
  default = "Terraform"
  validation {
    condition = contains([
      "ARM",
      "Terraform"
    ], var.deployment_type)
    error_message = "Stage must be either: ARM or Terraform."
  }
  description = "Represents the kind of deployment. Currently two modes: ARM or Terraform"
}

variable "location" {
  description = "The Azure location"
  default     = "West Europe"
}

variable "project_name" {
  description = "The project name"
  type        = string
}

variable "network_client_id" {
  type    = string
  default = ""
}

variable "network_client_secret" {
  type    = string
  default = ""
}

variable "fqdn" {
  type    = string
  default = ""
}

variable "kubernetes_azurefile_storage_class_sku" {
  type    = string
  default = "Premium_LRS"
}

variable "kubernetes_azurefile_storage_tags" {
  type    = string
  default = ""
}

variable "kubernetes_network_plugin" {
  type    = string
  default = "azure"
}

variable "kubernetes_version" {
  type    = string
  default = "1.27.7"
}

variable "kubernetes_nodepool_system_type" {
  type    = string
  default = "Standard_A2_v2"
}

variable "kubernetes_basic_compute_type" {
  type    = string
  default = "Standard_F4s_v2"
}

variable "kubernetes_highcpu_compute_type" {
  type    = string
  default = "Standard_F72s_v2"
}

variable "kubernetes_highmemory_compute_type" {
  type    = string
  default = "Standard_E16ads_v5"
}

variable "kubernetes_monitoring_type" {
  type    = string
  default = "Standard_D2ads_v5"
}

variable "kubernetes_services_type" {
  type    = string
  default = "Standard_B4ms"
}

variable "kubernetes_db_type" {
  type    = string
  default = "Standard_D2ads_v5"
}

variable "kubernetes_max_basic_compute_instances" {
  type    = number
  default = 5
}

variable "kubernetes_max_highcpu_compute_instances" {
  type    = number
  default = 2
}
variable "kubernetes_max_highmemory_compute_instances" {
  type    = number
  default = 3
}

variable "kubernetes_max_monitoring_instances" {
  type    = number
  default = 10
}

variable "kubernetes_max_services_instances" {
  type    = number
  default = 5
}

variable "kubernetes_min_db_instances" {
  type    = number
  default = 2
}

variable "kubernetes_max_db_instances" {
  type    = number
  default = 6
}

variable "publicip_new_or_existing_or_none" {
  type    = string
  default = "new"
}

variable "publicip_resource_group" {
  type    = string
  default = ""
}

variable "client_id" {
  type        = string
  description = "The client id"
}

variable "client_secret" {
  type        = string
  description = "The client secret"
}

variable "vnet_name" {
  type    = string
  default = ""
}

variable "vnet_new" {
  type    = string
  default = "new"
}

variable "vnet_resource_group" {
  type    = string
  default = ""
}

variable "virtual_network_address_prefix" {
  description = "The Virtual Network IP range. Minimum /26 NetMaskLength"
  type        = string
  default     = "10.21.0.0/16"
}
variable "virtual_network_subnet_address_prefix" {
  type    = string
  default = "10.21.0.0/16"
}

variable "subnet_name" {
  type    = string
  default = ""
}

variable "private_dns_name_blob" {
  type    = string
  default = "privatelink.blob.core.windows.net"
}

variable "private_dns_name_queue" {
  type    = string
  default = "privatelink.queue.core.windows.net"
}
variable "private_dns_name_table" {
  type    = string
  default = "privatelink.table.core.windows.net"
}
variable "private_dns_name_eventhub" {
  type    = string
  default = "privatelink.servicebus.windows.net"
}
variable "private_dns_name_adt" {
  type    = string
  default = "privatelink.digitaltwins.azure.net"
}

variable "owner_list" {
  description = "List of mail addresses for App Registration owners"
  type        = list(string)
}

# ARM deployment mode
variable "network_sp_object_id" {
  type        = string
  description = "The ID of the existing Network's service principal"
  default     = ""
}

variable "loadbalancer_ip" {
  type    = string
  default = ""
}

variable "subscription_id" {
  description = "The subscription id"
  type        = string
}

variable "tenant_id" {
  type = string
}

variable "resource_group" {
  type    = string
  default = ""
}

variable "dns_record" {
  description = "The DNS zone name to create platform subdomain. Example: myplatform"
  type        = string
}

variable "dns_zone_name" {
  description = "The DNS zone name to create platform subdomain. Example: api.cosmotech.com"
  type        = string
  default     = "api.cosmotech.com"
}

variable "dns_zone_rg" {
  description = "The DNS zone resource group"
  type        = string
  default     = "phoenix"
}

variable "api_dns_name" {
  type    = string
  default = ""
}

variable "api_version_path" {
  description = "The API version path"
  type        = string
  default     = "/"
}

variable "cluster_name" {
  type    = string
  default = ""
}

variable "namespace" {
  type    = string
  default = "phoenix"
}

variable "monitoring_namespace" {
  type    = string
  default = "cosmotech-monitoring"
}

variable "cluster_issuer_email" {
  type    = string
  default = "platform@cosmotech.com"
}

variable "cluster_issuer_name" {
  type    = string
  default = "letsencrypt-prod"
}

variable "ingress_nginx_version" {
  type    = string
  default = "4.2.5"
}

variable "platform_url" {
  description = "The platform url"
  type        = string
  default     = ""
}

variable "identifier_uri" {
  description = "The platform identifier uri"
  type        = string
  default     = ""
}

variable "project_stage" {
  description = "The Project stage"
  type        = string
  default     = "Dev"
  validation {
    condition = contains([
      "OnBoarding",
      "Dev",
      "QA",
      "IA",
      "EA",
      "Doc",
      "Support",
      "Demo",
      "Prod",
      "PreProd"
    ], var.project_stage)
    error_message = "Stage must be either: OnBoarding, Dev, QA, IA, EA, Demo, Prod, PreProd, Doc, Support."
  }
}

variable "tls_secret_name" {
  type    = string
  default = "letsencrypt-prod"
}

variable "tls_certificate_type" {
  type    = string
  default = "let_s_encrypt"
  validation {
    condition = contains([
      "let_s_encrypt",
      "custom",
      "none"
    ], var.tls_certificate_type)
    error_message = "Only let_s_encrypt and none are supported for tls_certificate_type."
  }
}

variable "customer_name" {
  description = "The customer name"
  type        = string
  default     = "cosmotech"
}

variable "audience" {
  description = "The App Registration audience type"
  type        = string
  validation {
    condition = contains([
      "AzureADMyOrg",
      "AzureADMultipleOrgs"
    ], var.audience)
    error_message = "Only AzureADMyOrg and AzureADMultipleOrgs are supported for audience."
  }
  default = "AzureADMultipleOrgs"
}

variable "image_path" {
  type    = string
  default = "./cosmotech.png"
}

variable "create_dnsrecord" {
  description = "Create the DNS record"
  type        = bool
  default     = true
}

variable "create_cosmosdb" {
  type    = bool
  default = false
}

variable "create_backup" {
  type    = bool
  default = false
}

variable "create_adx" {
  type    = bool
  default = false
}

variable "create_prometheus_stack" {
  type    = bool
  default = true
}

variable "public_ip_name" {
  type    = string
  default = ""
}

variable "tls_certificate_custom_certificate" {
  type    = string
  default = ""
}

variable "tls_certificate_custom_key" {
  type    = string
  default = ""
}

# Backend remote vars
variable "tf_resource_group_name" {
  type        = string
  default     = ""
  description = <<EOT
Variable to be used with backend remote option :
First set necessary vars:
- export TF_VAR_tf_resource_group_name="some_value"
Then call terraform init:
terraform init \
    -backend-config "resource_group_name=$TF_VAR_tf_resource_group_name" \
    -backend-config "storage_account_name=$TF_VAR_tf_storage_account_name" \
    -backend-config "container_name=$TF_VAR_tf_container_name" \
    -backend-config "key=$TF_VAR_tf_blob_name" \
    -backend-config "access_key=$TF_VAR_tf_access_key"
EOT
}

variable "tf_storage_account_name" {
  type        = string
  default     = ""
  description = <<EOT
Variable to be used with backend remote option :
First set necessary vars:
- export TF_VAR_tf_storage_account_name="some_value"
Then call terraform init:
terraform init \
    -backend-config "resource_group_name=$TF_VAR_tf_resource_group_name" \
    -backend-config "storage_account_name=$TF_VAR_tf_storage_account_name" \
    -backend-config "container_name=$TF_VAR_tf_container_name" \
    -backend-config "key=$TF_VAR_tf_blob_name" \
    -backend-config "access_key=$TF_VAR_tf_access_key"
EOT
}

variable "tf_container_name" {
  type        = string
  default     = ""
  description = <<EOT
Variable to be used with backend remote option :
First set necessary vars:
- export TF_VAR_tf_container_name="some_value"
Then call terraform init:
terraform init \
    -backend-config "resource_group_name=$TF_VAR_tf_resource_group_name" \
    -backend-config "storage_account_name=$TF_VAR_tf_storage_account_name" \
    -backend-config "container_name=$TF_VAR_tf_container_name" \
    -backend-config "key=$TF_VAR_tf_blob_name" \
    -backend-config "access_key=$TF_VAR_tf_access_key"
EOT
}

variable "tf_blob_name" {
  type        = string
  default     = ""
  description = <<EOT
Variable to be used with backend remote option :
First set necessary vars:
- export TF_VAR_tf_blob_name="some_value"
Then call terraform init:
terraform init \
    -backend-config "resource_group_name=$TF_VAR_tf_resource_group_name" \
    -backend-config "storage_account_name=$TF_VAR_tf_storage_account_name" \
    -backend-config "container_name=$TF_VAR_tf_container_name" \
    -backend-config "key=$TF_VAR_tf_blob_name" \
    -backend-config "access_key=$TF_VAR_tf_access_key"
EOT
}

variable "tf_access_key" {
  type        = string
  default     = ""
  description = <<EOT
Variable to be used with backend remote option :
First set necessary vars:
- export TF_VAR_tf_access_key="some_value"
Then call terraform init:
terraform init \
    -backend-config "resource_group_name=$TF_VAR_tf_resource_group_name" \
    -backend-config "storage_account_name=$TF_VAR_tf_storage_account_name" \
    -backend-config "container_name=$TF_VAR_tf_container_name" \
    -backend-config "key=$TF_VAR_tf_blob_name" \
    -backend-config "access_key=$TF_VAR_tf_access_key"
EOT
}

variable "loki_release_name" {
  type    = string
  default = "loki"
}
variable "loki_persistence_memory" {
  type    = string
  default = "4Gi"
}

variable "loki_retention_period" {
  type    = string
  default = "720h"
}

variable "helm_repo_url" {
  type    = string
  default = "https://grafana.github.io/helm-charts"
}

variable "helm_chart" {
  type    = string
  default = "loki-stack"
}

variable "loki_max_entries_limet_per_query" {
  type    = number
  default = 50000
}

variable "temporary_name_for_rotation_system_pool" {
  type    = string
  default = "systemrotation"
}

variable "kubernetes_min_monitoring_instances" {
  type    = number
  default = 1
}

variable "kubernetes_min_services_instances" {
  type    = number
  default = 2
}

variable "kubernetes_min_highmemory_compute_instances" {
  type    = number
  default = 0
}

variable "kubernetes_min_highcpu_compute_instances" {
  type    = number
  default = 0
}

variable "kubernetes_min_basic_compute_instances" {
  type    = number
  default = 1
}

variable "kubernetes_min_system_instances" {
  type    = number
  default = 3
}

variable "kubernetes_max_system_instances" {
  type    = number
  default = 6
}

variable "kubernetes_max_monitoring_pods" {
  type    = number
  default = 110
}

variable "kubernetes_max_db_pods" {
  type    = number
  default = 110
}

variable "kubernetes_max_services_pods" {
  type    = number
  default = 110
}

variable "kubernetes_max_highmemory_pods" {
  type    = number
  default = 110
}

variable "kubernetes_max_highcpu_pods" {
  type    = number
  default = 110
}

variable "kubernetes_max_basic_pods" {
  type    = number
  default = 110
}

variable "kubernetes_max_system_pods" {
  type    = number
  default = 110
}

variable "kubernetes_monitoring_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_db_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_services_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_highmemory_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_highcpu_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_basic_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_system_os_disk_size" {
  type    = number
  default = 128
}

variable "kubernetes_system_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_basic_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_highcpu_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_highmemory_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_services_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_db_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_monitoring_enable_auto_scaling" {
  type    = bool
  default = true
}

variable "kubernetes_nodepool_system_name" {
  type = string
  default = "system"
}

variable "prom_cpu_mem_limits" {
  type    = string
  default = "4Gi"
}

variable "prom_cpu_mem_request" {
  type    = string
  default = "2Gi"
}

variable "grafana_loki_compatibility_image_tag" {
  type = string
  default = "9.3.6"
}