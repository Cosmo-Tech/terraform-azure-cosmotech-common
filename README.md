<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.38.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.54.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cosmotech-platform"></a> [cosmotech-platform](#module\_cosmotech-platform) | ./platform-common-resources | n/a |
| <a name="module_cosmotech-prerequisites"></a> [cosmotech-prerequisites](#module\_cosmotech-prerequisites) | ./azure-common-resources | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.cluster_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The client id | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The client secret | `string` | n/a | yes |
| <a name="input_dns_record"></a> [dns\_record](#input\_dns\_record) | The DNS zone name to create platform subdomain. Example: myplatform | `string` | n/a | yes |
| <a name="input_owner_list"></a> [owner\_list](#input\_owner\_list) | List of mail addresses for App Registration owners | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription id | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_api_dns_name"></a> [api\_dns\_name](#input\_api\_dns\_name) | n/a | `string` | `""` | no |
| <a name="input_api_version_path"></a> [api\_version\_path](#input\_api\_version\_path) | The API version path | `string` | `"/"` | no |
| <a name="input_audience"></a> [audience](#input\_audience) | The App Registration audience type | `string` | `"AzureADMultipleOrgs"` | no |
| <a name="input_cluster_issuer_email"></a> [cluster\_issuer\_email](#input\_cluster\_issuer\_email) | n/a | `string` | `"platform@cosmotech.com"` | no |
| <a name="input_cluster_issuer_name"></a> [cluster\_issuer\_name](#input\_cluster\_issuer\_name) | n/a | `string` | `"letsencrypt-prod"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `""` | no |
| <a name="input_create_adx"></a> [create\_adx](#input\_create\_adx) | n/a | `bool` | `false` | no |
| <a name="input_create_backup"></a> [create\_backup](#input\_create\_backup) | n/a | `bool` | `false` | no |
| <a name="input_create_cosmosdb"></a> [create\_cosmosdb](#input\_create\_cosmosdb) | n/a | `bool` | `false` | no |
| <a name="input_create_dnsrecord"></a> [create\_dnsrecord](#input\_create\_dnsrecord) | Create the DNS record | `bool` | `true` | no |
| <a name="input_create_prometheus_stack"></a> [create\_prometheus\_stack](#input\_create\_prometheus\_stack) | n/a | `bool` | `true` | no |
| <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name) | The customer name | `string` | `"cosmotech"` | no |
| <a name="input_deployment_type"></a> [deployment\_type](#input\_deployment\_type) | Represents the kind of deployment. Currently two modes: ARM or Terraform | `string` | `"Terraform"` | no |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | The DNS zone name to create platform subdomain. Example: api.cosmotech.com | `string` | `"api.cosmotech.com"` | no |
| <a name="input_dns_zone_rg"></a> [dns\_zone\_rg](#input\_dns\_zone\_rg) | The DNS zone resource group | `string` | `"phoenix"` | no |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | n/a | `string` | `""` | no |
| <a name="input_helm_chart"></a> [helm\_chart](#input\_helm\_chart) | n/a | `string` | `"loki-stack"` | no |
| <a name="input_helm_repo_url"></a> [helm\_repo\_url](#input\_helm\_repo\_url) | n/a | `string` | `"https://grafana.github.io/helm-charts"` | no |
| <a name="input_identifier_uri"></a> [identifier\_uri](#input\_identifier\_uri) | The platform identifier uri | `string` | `""` | no |
| <a name="input_image_path"></a> [image\_path](#input\_image\_path) | n/a | `string` | `"./cosmotech.png"` | no |
| <a name="input_ingress_nginx_version"></a> [ingress\_nginx\_version](#input\_ingress\_nginx\_version) | n/a | `string` | `"4.2.5"` | no |
| <a name="input_kubernetes_azurefile_storage_class_sku"></a> [kubernetes\_azurefile\_storage\_class\_sku](#input\_kubernetes\_azurefile\_storage\_class\_sku) | n/a | `string` | `"Premium_LRS"` | no |
| <a name="input_kubernetes_azurefile_storage_tags"></a> [kubernetes\_azurefile\_storage\_tags](#input\_kubernetes\_azurefile\_storage\_tags) | n/a | `string` | `""` | no |
| <a name="input_kubernetes_basic_compute_type"></a> [kubernetes\_basic\_compute\_type](#input\_kubernetes\_basic\_compute\_type) | n/a | `string` | `"Standard_F4s_v2"` | no |
| <a name="input_kubernetes_db_type"></a> [kubernetes\_db\_type](#input\_kubernetes\_db\_type) | n/a | `string` | `"Standard_D2ads_v5"` | no |
| <a name="input_kubernetes_highcpu_compute_type"></a> [kubernetes\_highcpu\_compute\_type](#input\_kubernetes\_highcpu\_compute\_type) | n/a | `string` | `"Standard_F72s_v2"` | no |
| <a name="input_kubernetes_highmemory_compute_type"></a> [kubernetes\_highmemory\_compute\_type](#input\_kubernetes\_highmemory\_compute\_type) | n/a | `string` | `"Standard_E16ads_v5"` | no |
| <a name="input_kubernetes_max_basic_compute_instances"></a> [kubernetes\_max\_basic\_compute\_instances](#input\_kubernetes\_max\_basic\_compute\_instances) | n/a | `number` | `5` | no |
| <a name="input_kubernetes_max_db_instances"></a> [kubernetes\_max\_db\_instances](#input\_kubernetes\_max\_db\_instances) | n/a | `number` | `5` | no |
| <a name="input_kubernetes_max_highcpu_compute_instances"></a> [kubernetes\_max\_highcpu\_compute\_instances](#input\_kubernetes\_max\_highcpu\_compute\_instances) | n/a | `number` | `2` | no |
| <a name="input_kubernetes_max_highmemory_compute_instances"></a> [kubernetes\_max\_highmemory\_compute\_instances](#input\_kubernetes\_max\_highmemory\_compute\_instances) | n/a | `number` | `3` | no |
| <a name="input_kubernetes_max_monitoring_instances"></a> [kubernetes\_max\_monitoring\_instances](#input\_kubernetes\_max\_monitoring\_instances) | n/a | `number` | `10` | no |
| <a name="input_kubernetes_max_services_instances"></a> [kubernetes\_max\_services\_instances](#input\_kubernetes\_max\_services\_instances) | n/a | `number` | `5` | no |
| <a name="input_kubernetes_min_db_instances"></a> [kubernetes\_min\_db\_instances](#input\_kubernetes\_min\_db\_instances) | n/a | `number` | `2` | no |
| <a name="input_kubernetes_monitoring_type"></a> [kubernetes\_monitoring\_type](#input\_kubernetes\_monitoring\_type) | n/a | `string` | `"Standard_D2ads_v5"` | no |
| <a name="input_kubernetes_network_plugin"></a> [kubernetes\_network\_plugin](#input\_kubernetes\_network\_plugin) | n/a | `string` | `"azure"` | no |
| <a name="input_kubernetes_nodepool_system_type"></a> [kubernetes\_nodepool\_system\_type](#input\_kubernetes\_nodepool\_system\_type) | n/a | `string` | `"Standard_A2_v2"` | no |
| <a name="input_kubernetes_services_type"></a> [kubernetes\_services\_type](#input\_kubernetes\_services\_type) | n/a | `string` | `"Standard_B4ms"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | n/a | `string` | `"1.26.10"` | no |
| <a name="input_loadbalancer_ip"></a> [loadbalancer\_ip](#input\_loadbalancer\_ip) | n/a | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure location | `string` | `"West Europe"` | no |
| <a name="input_loki_max_entries_limet_per_query"></a> [loki\_max\_entries\_limet\_per\_query](#input\_loki\_max\_entries\_limet\_per\_query) | n/a | `number` | `50000` | no |
| <a name="input_loki_persistence_memory"></a> [loki\_persistence\_memory](#input\_loki\_persistence\_memory) | n/a | `string` | `"4Gi"` | no |
| <a name="input_loki_release_name"></a> [loki\_release\_name](#input\_loki\_release\_name) | n/a | `string` | `"loki"` | no |
| <a name="input_loki_retention_period"></a> [loki\_retention\_period](#input\_loki\_retention\_period) | n/a | `string` | `"720h"` | no |
| <a name="input_monitoring_namespace"></a> [monitoring\_namespace](#input\_monitoring\_namespace) | n/a | `string` | `"cosmotech-monitoring"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `"phoenix"` | no |
| <a name="input_network_client_id"></a> [network\_client\_id](#input\_network\_client\_id) | n/a | `string` | `""` | no |
| <a name="input_network_client_secret"></a> [network\_client\_secret](#input\_network\_client\_secret) | n/a | `string` | `""` | no |
| <a name="input_network_sp_object_id"></a> [network\_sp\_object\_id](#input\_network\_sp\_object\_id) | The ID of the existing Network's service principal | `string` | `""` | no |
| <a name="input_platform_url"></a> [platform\_url](#input\_platform\_url) | The platform url | `string` | `""` | no |
| <a name="input_private_dns_name_adt"></a> [private\_dns\_name\_adt](#input\_private\_dns\_name\_adt) | n/a | `string` | `"privatelink.digitaltwins.azure.net"` | no |
| <a name="input_private_dns_name_blob"></a> [private\_dns\_name\_blob](#input\_private\_dns\_name\_blob) | n/a | `string` | `"privatelink.blob.core.windows.net"` | no |
| <a name="input_private_dns_name_eventhub"></a> [private\_dns\_name\_eventhub](#input\_private\_dns\_name\_eventhub) | n/a | `string` | `"privatelink.servicebus.windows.net"` | no |
| <a name="input_private_dns_name_queue"></a> [private\_dns\_name\_queue](#input\_private\_dns\_name\_queue) | n/a | `string` | `"privatelink.queue.core.windows.net"` | no |
| <a name="input_private_dns_name_table"></a> [private\_dns\_name\_table](#input\_private\_dns\_name\_table) | n/a | `string` | `"privatelink.table.core.windows.net"` | no |
| <a name="input_project_stage"></a> [project\_stage](#input\_project\_stage) | The Project stage | `string` | `"Dev"` | no |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | n/a | `string` | `""` | no |
| <a name="input_publicip_new_or_existing_or_none"></a> [publicip\_new\_or\_existing\_or\_none](#input\_publicip\_new\_or\_existing\_or\_none) | n/a | `string` | `"new"` | no |
| <a name="input_publicip_resource_group"></a> [publicip\_resource\_group](#input\_publicip\_resource\_group) | n/a | `string` | `""` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | n/a | `string` | `""` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | n/a | `string` | `""` | no |
| <a name="input_tf_access_key"></a> [tf\_access\_key](#input\_tf\_access\_key) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_access\_key="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tf_blob_name"></a> [tf\_blob\_name](#input\_tf\_blob\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_blob\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tf_container_name"></a> [tf\_container\_name](#input\_tf\_container\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_container\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tf_resource_group_name"></a> [tf\_resource\_group\_name](#input\_tf\_resource\_group\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_resource\_group\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tf_storage_account_name"></a> [tf\_storage\_account\_name](#input\_tf\_storage\_account\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_storage\_account\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tls_certificate_custom_certificate"></a> [tls\_certificate\_custom\_certificate](#input\_tls\_certificate\_custom\_certificate) | n/a | `string` | `""` | no |
| <a name="input_tls_certificate_custom_key"></a> [tls\_certificate\_custom\_key](#input\_tls\_certificate\_custom\_key) | n/a | `string` | `""` | no |
| <a name="input_tls_certificate_type"></a> [tls\_certificate\_type](#input\_tls\_certificate\_type) | n/a | `string` | `"let_s_encrypt"` | no |
| <a name="input_tls_secret_name"></a> [tls\_secret\_name](#input\_tls\_secret\_name) | n/a | `string` | `"letsencrypt-prod"` | no |
| <a name="input_virtual_network_address_prefix"></a> [virtual\_network\_address\_prefix](#input\_virtual\_network\_address\_prefix) | The Virtual Network IP range. Minimum /26 NetMaskLength | `string` | `"10.21.0.0/16"` | no |
| <a name="input_virtual_network_subnet_address_prefix"></a> [virtual\_network\_subnet\_address\_prefix](#input\_virtual\_network\_subnet\_address\_prefix) | n/a | `string` | `"10.21.0.0/16"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | n/a | `string` | `""` | no |
| <a name="input_vnet_new"></a> [vnet\_new](#input\_vnet\_new) | n/a | `string` | `"new"` | no |
| <a name="input_vnet_resource_group"></a> [vnet\_resource\_group](#input\_vnet\_resource\_group) | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_out_cluster_name"></a> [out\_cluster\_name](#output\_out\_cluster\_name) | n/a |
| <a name="output_out_network_sp_client_id"></a> [out\_network\_sp\_client\_id](#output\_out\_network\_sp\_client\_id) | n/a |
| <a name="output_out_network_sp_object_id"></a> [out\_network\_sp\_object\_id](#output\_out\_network\_sp\_object\_id) | n/a |
| <a name="output_out_platform_object_id"></a> [out\_platform\_object\_id](#output\_out\_platform\_object\_id) | n/a |
| <a name="output_out_platform_sp_name"></a> [out\_platform\_sp\_name](#output\_out\_platform\_sp\_name) | n/a |
| <a name="output_out_public_ip_name"></a> [out\_public\_ip\_name](#output\_out\_public\_ip\_name) | n/a |
| <a name="output_out_vnet_name"></a> [out\_vnet\_name](#output\_out\_vnet\_name) | n/a |
<!-- END_TF_DOCS -->