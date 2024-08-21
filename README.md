<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.48.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.54.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.9.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 2.0.4 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cosmotech-platform"></a> [cosmotech-platform](#module\_cosmotech-platform) | Cosmo-Tech/platform-core/cosmotech | 1.1.3 |
| <a name="module_cosmotech-prerequisites"></a> [cosmotech-prerequisites](#module\_cosmotech-prerequisites) | ./azure-common-resources | n/a |
| <a name="module_create_argocd"></a> [create\_argocd](#module\_create\_argocd) | ./create_argocd | n/a |
| <a name="module_create_vault"></a> [create\_vault](#module\_create\_vault) | ./create_vault | n/a |
| <a name="module_create_vault_secrets_operator"></a> [create\_vault\_secrets\_operator](#module\_create\_vault\_secrets\_operator) | ./create-vault-secrets-operator | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.cluster_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_create_ingress"></a> [argocd\_create\_ingress](#input\_argocd\_create\_ingress) | n/a | `bool` | n/a | yes |
| <a name="input_argocd_helm_chart"></a> [argocd\_helm\_chart](#input\_argocd\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_argocd_helm_chart_version"></a> [argocd\_helm\_chart\_version](#input\_argocd\_helm\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_argocd_helm_release_name"></a> [argocd\_helm\_release\_name](#input\_argocd\_helm\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_argocd_helm_repo_url"></a> [argocd\_helm\_repo\_url](#input\_argocd\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_argocd_project"></a> [argocd\_project](#input\_argocd\_project) | n/a | `string` | n/a | yes |
| <a name="input_argocd_replicas"></a> [argocd\_replicas](#input\_argocd\_replicas) | n/a | `number` | n/a | yes |
| <a name="input_argocd_repositories"></a> [argocd\_repositories](#input\_argocd\_repositories) | n/a | `list(string)` | n/a | yes |
| <a name="input_argocd_repository_access_token"></a> [argocd\_repository\_access\_token](#input\_argocd\_repository\_access\_token) | n/a | `string` | n/a | yes |
| <a name="input_argocd_repository_username"></a> [argocd\_repository\_username](#input\_argocd\_repository\_username) | n/a | `string` | n/a | yes |
| <a name="input_argocd_setup_job_image_version"></a> [argocd\_setup\_job\_image\_version](#input\_argocd\_setup\_job\_image\_version) | n/a | `string` | n/a | yes |
| <a name="input_create_argocd"></a> [create\_argocd](#input\_create\_argocd) | n/a | `bool` | n/a | yes |
| <a name="input_create_keycloak"></a> [create\_keycloak](#input\_create\_keycloak) | n/a | `bool` | n/a | yes |
| <a name="input_create_vault"></a> [create\_vault](#input\_create\_vault) | n/a | `bool` | n/a | yes |
| <a name="input_create_vault_secrets_operator"></a> [create\_vault\_secrets\_operator](#input\_create\_vault\_secrets\_operator) | n/a | `bool` | n/a | yes |
| <a name="input_is_bare_metal"></a> [is\_bare\_metal](#input\_is\_bare\_metal) | n/a | `bool` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | n/a | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | n/a | `string` | n/a | yes |
| <a name="input_owner_list"></a> [owner\_list](#input\_owner\_list) | List of mail addresses for App Registration owners | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name | `string` | n/a | yes |
| <a name="input_prom_namespace"></a> [prom\_namespace](#input\_prom\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription id | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_vault_helm_chart"></a> [vault\_helm\_chart](#input\_vault\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_vault_helm_chart_version"></a> [vault\_helm\_chart\_version](#input\_vault\_helm\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_vault_helm_release_name"></a> [vault\_helm\_release\_name](#input\_vault\_helm\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_vault_helm_repo_url"></a> [vault\_helm\_repo\_url](#input\_vault\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_vault_ingress_enabled"></a> [vault\_ingress\_enabled](#input\_vault\_ingress\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_vault_replicas"></a> [vault\_replicas](#input\_vault\_replicas) | n/a | `number` | n/a | yes |
| <a name="input_vault_secret_name"></a> [vault\_secret\_name](#input\_vault\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_vault_secrets_operator_allowed_namespaces"></a> [vault\_secrets\_operator\_allowed\_namespaces](#input\_vault\_secrets\_operator\_allowed\_namespaces) | List of namespaces allowed to access secrets | `list(string)` | n/a | yes |
| <a name="input_vault_secrets_operator_helm_chart"></a> [vault\_secrets\_operator\_helm\_chart](#input\_vault\_secrets\_operator\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_vault_secrets_operator_helm_chart_version"></a> [vault\_secrets\_operator\_helm\_chart\_version](#input\_vault\_secrets\_operator\_helm\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_vault_secrets_operator_helm_release_name"></a> [vault\_secrets\_operator\_helm\_release\_name](#input\_vault\_secrets\_operator\_helm\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_vault_secrets_operator_helm_repo_url"></a> [vault\_secrets\_operator\_helm\_repo\_url](#input\_vault\_secrets\_operator\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_vault_secrets_operator_replicas"></a> [vault\_secrets\_operator\_replicas](#input\_vault\_secrets\_operator\_replicas) | n/a | `number` | n/a | yes |
| <a name="input_workspace_key"></a> [workspace\_key](#input\_workspace\_key) | n/a | `string` | n/a | yes |
| <a name="input_api_dns_name"></a> [api\_dns\_name](#input\_api\_dns\_name) | n/a | `string` | `""` | no |
| <a name="input_api_version_path"></a> [api\_version\_path](#input\_api\_version\_path) | The API version path | `string` | `"/"` | no |
| <a name="input_argocd_namespace"></a> [argocd\_namespace](#input\_argocd\_namespace) | n/a | `string` | `"argocd"` | no |
| <a name="input_audience"></a> [audience](#input\_audience) | The App Registration audience type | `string` | `"AzureADMultipleOrgs"` | no |
| <a name="input_cert_manager_helm_release_name"></a> [cert\_manager\_helm\_release\_name](#input\_cert\_manager\_helm\_release\_name) | n/a | `string` | `"cert-manager"` | no |
| <a name="input_cert_manager_helm_repo_url"></a> [cert\_manager\_helm\_repo\_url](#input\_cert\_manager\_helm\_repo\_url) | n/a | `string` | `"https://charts.jetstack.io"` | no |
| <a name="input_cert_manager_namespace"></a> [cert\_manager\_namespace](#input\_cert\_manager\_namespace) | n/a | `string` | `"cert-manager"` | no |
| <a name="input_cert_manager_version"></a> [cert\_manager\_version](#input\_cert\_manager\_version) | HELM Chart Version for cert-manager | `string` | `"1.11.0"` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The client id | `string` | `""` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The client secret | `string` | `""` | no |
| <a name="input_cluster_issuer_email"></a> [cluster\_issuer\_email](#input\_cluster\_issuer\_email) | n/a | `string` | `"platform@cosmotech.com"` | no |
| <a name="input_cluster_issuer_name"></a> [cluster\_issuer\_name](#input\_cluster\_issuer\_name) | n/a | `string` | `"letsencrypt-prod"` | no |
| <a name="input_cluster_issuer_server"></a> [cluster\_issuer\_server](#input\_cluster\_issuer\_server) | The ACME server URL | `string` | `"https://acme-v02.api.letsencrypt.org/directory"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `""` | no |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | n/a | `string` | `"NA"` | no |
| <a name="input_create_adx"></a> [create\_adx](#input\_create\_adx) | n/a | `bool` | `false` | no |
| <a name="input_create_babylon"></a> [create\_babylon](#input\_create\_babylon) | Create the Azure Active Directory Application for Babylon | `bool` | `false` | no |
| <a name="input_create_backup"></a> [create\_backup](#input\_create\_backup) | n/a | `bool` | `false` | no |
| <a name="input_create_cosmosdb"></a> [create\_cosmosdb](#input\_create\_cosmosdb) | n/a | `bool` | `false` | no |
| <a name="input_create_dnsrecord"></a> [create\_dnsrecord](#input\_create\_dnsrecord) | Create the DNS record | `bool` | `true` | no |
| <a name="input_create_prometheus_stack"></a> [create\_prometheus\_stack](#input\_create\_prometheus\_stack) | n/a | `bool` | `true` | no |
| <a name="input_create_secrets"></a> [create\_secrets](#input\_create\_secrets) | n/a | `bool` | `true` | no |
| <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name) | The customer name | `string` | `"cosmotech"` | no |
| <a name="input_deployment_type"></a> [deployment\_type](#input\_deployment\_type) | Represents the kind of deployment. Currently two modes: ARM or Terraform | `string` | `"Terraform"` | no |
| <a name="input_dns_record"></a> [dns\_record](#input\_dns\_record) | The DNS zone name to create platform subdomain. Example: myplatform | `string` | `""` | no |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | The DNS zone name to create platform subdomain. Example: api.cosmotech.com | `string` | `"api.cosmotech.com"` | no |
| <a name="input_dns_zone_rg"></a> [dns\_zone\_rg](#input\_dns\_zone\_rg) | The DNS zone resource group | `string` | `"phoenix"` | no |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | n/a | `string` | `""` | no |
| <a name="input_grafana_loki_compatibility_image_tag"></a> [grafana\_loki\_compatibility\_image\_tag](#input\_grafana\_loki\_compatibility\_image\_tag) | n/a | `string` | `"9.3.6"` | no |
| <a name="input_identifier_uri"></a> [identifier\_uri](#input\_identifier\_uri) | The platform identifier uri | `string` | `""` | no |
| <a name="input_image_path"></a> [image\_path](#input\_image\_path) | n/a | `string` | `"./cosmotech.png"` | no |
| <a name="input_ingress_nginx_helm_release_name"></a> [ingress\_nginx\_helm\_release\_name](#input\_ingress\_nginx\_helm\_release\_name) | n/a | `string` | `"ingress-nginx"` | no |
| <a name="input_ingress_nginx_helm_repo_url"></a> [ingress\_nginx\_helm\_repo\_url](#input\_ingress\_nginx\_helm\_repo\_url) | n/a | `string` | `"https://kubernetes.github.io/ingress-nginx"` | no |
| <a name="input_ingress_nginx_namespace"></a> [ingress\_nginx\_namespace](#input\_ingress\_nginx\_namespace) | n/a | `string` | `"ingress-nginx"` | no |
| <a name="input_ingress_nginx_replica_count"></a> [ingress\_nginx\_replica\_count](#input\_ingress\_nginx\_replica\_count) | n/a | `number` | `1` | no |
| <a name="input_ingress_nginx_version"></a> [ingress\_nginx\_version](#input\_ingress\_nginx\_version) | n/a | `string` | `"4.2.5"` | no |
| <a name="input_keycloak_admin_user"></a> [keycloak\_admin\_user](#input\_keycloak\_admin\_user) | n/a | `string` | `"admin-cosmo"` | no |
| <a name="input_keycloak_helm_chart"></a> [keycloak\_helm\_chart](#input\_keycloak\_helm\_chart) | n/a | `string` | `"keycloak"` | no |
| <a name="input_keycloak_helm_chart_version"></a> [keycloak\_helm\_chart\_version](#input\_keycloak\_helm\_chart\_version) | n/a | `string` | `"21.3.1"` | no |
| <a name="input_keycloak_helm_repo"></a> [keycloak\_helm\_repo](#input\_keycloak\_helm\_repo) | n/a | `string` | `"https://charts.bitnami.com/bitnami"` | no |
| <a name="input_keycloak_postgres_user"></a> [keycloak\_postgres\_user](#input\_keycloak\_postgres\_user) | n/a | `string` | `"keycloak_postgres_user"` | no |
| <a name="input_kubernetes_azurefile_storage_class_sku"></a> [kubernetes\_azurefile\_storage\_class\_sku](#input\_kubernetes\_azurefile\_storage\_class\_sku) | n/a | `string` | `"Premium_LRS"` | no |
| <a name="input_kubernetes_azurefile_storage_tags"></a> [kubernetes\_azurefile\_storage\_tags](#input\_kubernetes\_azurefile\_storage\_tags) | n/a | `string` | `""` | no |
| <a name="input_kubernetes_basic_compute_type"></a> [kubernetes\_basic\_compute\_type](#input\_kubernetes\_basic\_compute\_type) | n/a | `string` | `"Standard_F4s_v2"` | no |
| <a name="input_kubernetes_basic_enable_auto_scaling"></a> [kubernetes\_basic\_enable\_auto\_scaling](#input\_kubernetes\_basic\_enable\_auto\_scaling) | n/a | `bool` | `true` | no |
| <a name="input_kubernetes_basic_os_disk_size"></a> [kubernetes\_basic\_os\_disk\_size](#input\_kubernetes\_basic\_os\_disk\_size) | n/a | `number` | `128` | no |
| <a name="input_kubernetes_db_enable_auto_scaling"></a> [kubernetes\_db\_enable\_auto\_scaling](#input\_kubernetes\_db\_enable\_auto\_scaling) | n/a | `bool` | `true` | no |
| <a name="input_kubernetes_db_os_disk_size"></a> [kubernetes\_db\_os\_disk\_size](#input\_kubernetes\_db\_os\_disk\_size) | n/a | `number` | `128` | no |
| <a name="input_kubernetes_db_type"></a> [kubernetes\_db\_type](#input\_kubernetes\_db\_type) | n/a | `string` | `"Standard_D2ads_v5"` | no |
| <a name="input_kubernetes_highcpu_compute_type"></a> [kubernetes\_highcpu\_compute\_type](#input\_kubernetes\_highcpu\_compute\_type) | n/a | `string` | `"Standard_F72s_v2"` | no |
| <a name="input_kubernetes_highcpu_enable_auto_scaling"></a> [kubernetes\_highcpu\_enable\_auto\_scaling](#input\_kubernetes\_highcpu\_enable\_auto\_scaling) | n/a | `bool` | `true` | no |
| <a name="input_kubernetes_highcpu_os_disk_size"></a> [kubernetes\_highcpu\_os\_disk\_size](#input\_kubernetes\_highcpu\_os\_disk\_size) | n/a | `number` | `128` | no |
| <a name="input_kubernetes_highmemory_compute_type"></a> [kubernetes\_highmemory\_compute\_type](#input\_kubernetes\_highmemory\_compute\_type) | n/a | `string` | `"Standard_E16ads_v5"` | no |
| <a name="input_kubernetes_highmemory_enable_auto_scaling"></a> [kubernetes\_highmemory\_enable\_auto\_scaling](#input\_kubernetes\_highmemory\_enable\_auto\_scaling) | n/a | `bool` | `true` | no |
| <a name="input_kubernetes_highmemory_os_disk_size"></a> [kubernetes\_highmemory\_os\_disk\_size](#input\_kubernetes\_highmemory\_os\_disk\_size) | n/a | `number` | `128` | no |
| <a name="input_kubernetes_max_basic_compute_instances"></a> [kubernetes\_max\_basic\_compute\_instances](#input\_kubernetes\_max\_basic\_compute\_instances) | n/a | `number` | `5` | no |
| <a name="input_kubernetes_max_basic_pods"></a> [kubernetes\_max\_basic\_pods](#input\_kubernetes\_max\_basic\_pods) | n/a | `number` | `110` | no |
| <a name="input_kubernetes_max_db_instances"></a> [kubernetes\_max\_db\_instances](#input\_kubernetes\_max\_db\_instances) | n/a | `number` | `6` | no |
| <a name="input_kubernetes_max_db_pods"></a> [kubernetes\_max\_db\_pods](#input\_kubernetes\_max\_db\_pods) | n/a | `number` | `110` | no |
| <a name="input_kubernetes_max_highcpu_compute_instances"></a> [kubernetes\_max\_highcpu\_compute\_instances](#input\_kubernetes\_max\_highcpu\_compute\_instances) | n/a | `number` | `2` | no |
| <a name="input_kubernetes_max_highcpu_pods"></a> [kubernetes\_max\_highcpu\_pods](#input\_kubernetes\_max\_highcpu\_pods) | n/a | `number` | `110` | no |
| <a name="input_kubernetes_max_highmemory_compute_instances"></a> [kubernetes\_max\_highmemory\_compute\_instances](#input\_kubernetes\_max\_highmemory\_compute\_instances) | n/a | `number` | `3` | no |
| <a name="input_kubernetes_max_highmemory_pods"></a> [kubernetes\_max\_highmemory\_pods](#input\_kubernetes\_max\_highmemory\_pods) | n/a | `number` | `110` | no |
| <a name="input_kubernetes_max_monitoring_instances"></a> [kubernetes\_max\_monitoring\_instances](#input\_kubernetes\_max\_monitoring\_instances) | n/a | `number` | `10` | no |
| <a name="input_kubernetes_max_monitoring_pods"></a> [kubernetes\_max\_monitoring\_pods](#input\_kubernetes\_max\_monitoring\_pods) | n/a | `number` | `110` | no |
| <a name="input_kubernetes_max_services_instances"></a> [kubernetes\_max\_services\_instances](#input\_kubernetes\_max\_services\_instances) | n/a | `number` | `5` | no |
| <a name="input_kubernetes_max_services_pods"></a> [kubernetes\_max\_services\_pods](#input\_kubernetes\_max\_services\_pods) | n/a | `number` | `110` | no |
| <a name="input_kubernetes_max_system_instances"></a> [kubernetes\_max\_system\_instances](#input\_kubernetes\_max\_system\_instances) | n/a | `number` | `6` | no |
| <a name="input_kubernetes_max_system_pods"></a> [kubernetes\_max\_system\_pods](#input\_kubernetes\_max\_system\_pods) | n/a | `number` | `110` | no |
| <a name="input_kubernetes_min_basic_compute_instances"></a> [kubernetes\_min\_basic\_compute\_instances](#input\_kubernetes\_min\_basic\_compute\_instances) | n/a | `number` | `1` | no |
| <a name="input_kubernetes_min_db_instances"></a> [kubernetes\_min\_db\_instances](#input\_kubernetes\_min\_db\_instances) | n/a | `number` | `2` | no |
| <a name="input_kubernetes_min_highcpu_compute_instances"></a> [kubernetes\_min\_highcpu\_compute\_instances](#input\_kubernetes\_min\_highcpu\_compute\_instances) | n/a | `number` | `0` | no |
| <a name="input_kubernetes_min_highmemory_compute_instances"></a> [kubernetes\_min\_highmemory\_compute\_instances](#input\_kubernetes\_min\_highmemory\_compute\_instances) | n/a | `number` | `0` | no |
| <a name="input_kubernetes_min_monitoring_instances"></a> [kubernetes\_min\_monitoring\_instances](#input\_kubernetes\_min\_monitoring\_instances) | n/a | `number` | `1` | no |
| <a name="input_kubernetes_min_services_instances"></a> [kubernetes\_min\_services\_instances](#input\_kubernetes\_min\_services\_instances) | n/a | `number` | `2` | no |
| <a name="input_kubernetes_min_system_instances"></a> [kubernetes\_min\_system\_instances](#input\_kubernetes\_min\_system\_instances) | n/a | `number` | `3` | no |
| <a name="input_kubernetes_monitoring_enable_auto_scaling"></a> [kubernetes\_monitoring\_enable\_auto\_scaling](#input\_kubernetes\_monitoring\_enable\_auto\_scaling) | n/a | `bool` | `true` | no |
| <a name="input_kubernetes_monitoring_os_disk_size"></a> [kubernetes\_monitoring\_os\_disk\_size](#input\_kubernetes\_monitoring\_os\_disk\_size) | n/a | `number` | `128` | no |
| <a name="input_kubernetes_monitoring_type"></a> [kubernetes\_monitoring\_type](#input\_kubernetes\_monitoring\_type) | n/a | `string` | `"Standard_D2ads_v5"` | no |
| <a name="input_kubernetes_network_plugin"></a> [kubernetes\_network\_plugin](#input\_kubernetes\_network\_plugin) | n/a | `string` | `"azure"` | no |
| <a name="input_kubernetes_nodepool_system_name"></a> [kubernetes\_nodepool\_system\_name](#input\_kubernetes\_nodepool\_system\_name) | n/a | `string` | `"system"` | no |
| <a name="input_kubernetes_nodepool_system_type"></a> [kubernetes\_nodepool\_system\_type](#input\_kubernetes\_nodepool\_system\_type) | n/a | `string` | `"Standard_A2_v2"` | no |
| <a name="input_kubernetes_services_enable_auto_scaling"></a> [kubernetes\_services\_enable\_auto\_scaling](#input\_kubernetes\_services\_enable\_auto\_scaling) | n/a | `bool` | `true` | no |
| <a name="input_kubernetes_services_os_disk_size"></a> [kubernetes\_services\_os\_disk\_size](#input\_kubernetes\_services\_os\_disk\_size) | n/a | `number` | `128` | no |
| <a name="input_kubernetes_services_type"></a> [kubernetes\_services\_type](#input\_kubernetes\_services\_type) | n/a | `string` | `"Standard_B4ms"` | no |
| <a name="input_kubernetes_system_enable_auto_scaling"></a> [kubernetes\_system\_enable\_auto\_scaling](#input\_kubernetes\_system\_enable\_auto\_scaling) | n/a | `bool` | `true` | no |
| <a name="input_kubernetes_system_os_disk_size"></a> [kubernetes\_system\_os\_disk\_size](#input\_kubernetes\_system\_os\_disk\_size) | n/a | `number` | `128` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | n/a | `string` | `"1.27.7"` | no |
| <a name="input_loadbalancer_ip"></a> [loadbalancer\_ip](#input\_loadbalancer\_ip) | n/a | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure location | `string` | `"West Europe"` | no |
| <a name="input_loki_helm_chart"></a> [loki\_helm\_chart](#input\_loki\_helm\_chart) | n/a | `string` | `"loki-stack"` | no |
| <a name="input_loki_helm_repo_url"></a> [loki\_helm\_repo\_url](#input\_loki\_helm\_repo\_url) | n/a | `string` | `"https://grafana.github.io/helm-charts"` | no |
| <a name="input_loki_max_entries_limet_per_query"></a> [loki\_max\_entries\_limet\_per\_query](#input\_loki\_max\_entries\_limet\_per\_query) | n/a | `number` | `50000` | no |
| <a name="input_loki_namespace"></a> [loki\_namespace](#input\_loki\_namespace) | n/a | `string` | `"phoenix"` | no |
| <a name="input_loki_persistence_memory"></a> [loki\_persistence\_memory](#input\_loki\_persistence\_memory) | n/a | `string` | `"4Gi"` | no |
| <a name="input_loki_release_name"></a> [loki\_release\_name](#input\_loki\_release\_name) | n/a | `string` | `"loki"` | no |
| <a name="input_loki_retention_period"></a> [loki\_retention\_period](#input\_loki\_retention\_period) | n/a | `string` | `"720h"` | no |
| <a name="input_monitoring_namespace"></a> [monitoring\_namespace](#input\_monitoring\_namespace) | n/a | `string` | `"cosmotech-monitoring"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `"phoenix"` | no |
| <a name="input_network_client_id"></a> [network\_client\_id](#input\_network\_client\_id) | n/a | `string` | `""` | no |
| <a name="input_network_client_secret"></a> [network\_client\_secret](#input\_network\_client\_secret) | n/a | `string` | `""` | no |
| <a name="input_network_sp_object_id"></a> [network\_sp\_object\_id](#input\_network\_sp\_object\_id) | The ID of the existing Network's service principal | `string` | `""` | no |
| <a name="input_platform_url"></a> [platform\_url](#input\_platform\_url) | The platform url | `string` | `""` | no |
| <a name="input_postgres_helm_chart"></a> [postgres\_helm\_chart](#input\_postgres\_helm\_chart) | n/a | `string` | `"postgresql"` | no |
| <a name="input_postgres_helm_chart_version"></a> [postgres\_helm\_chart\_version](#input\_postgres\_helm\_chart\_version) | n/a | `string` | `"15.5.1"` | no |
| <a name="input_postgres_helm_repo"></a> [postgres\_helm\_repo](#input\_postgres\_helm\_repo) | n/a | `string` | `"https://charts.bitnami.com/bitnami"` | no |
| <a name="input_private_dns_name_adt"></a> [private\_dns\_name\_adt](#input\_private\_dns\_name\_adt) | n/a | `string` | `"privatelink.digitaltwins.azure.net"` | no |
| <a name="input_private_dns_name_blob"></a> [private\_dns\_name\_blob](#input\_private\_dns\_name\_blob) | n/a | `string` | `"privatelink.blob.core.windows.net"` | no |
| <a name="input_private_dns_name_eventhub"></a> [private\_dns\_name\_eventhub](#input\_private\_dns\_name\_eventhub) | n/a | `string` | `"privatelink.servicebus.windows.net"` | no |
| <a name="input_private_dns_name_queue"></a> [private\_dns\_name\_queue](#input\_private\_dns\_name\_queue) | n/a | `string` | `"privatelink.queue.core.windows.net"` | no |
| <a name="input_private_dns_name_table"></a> [private\_dns\_name\_table](#input\_private\_dns\_name\_table) | n/a | `string` | `"privatelink.table.core.windows.net"` | no |
| <a name="input_project_stage"></a> [project\_stage](#input\_project\_stage) | The Project stage | `string` | `"Dev"` | no |
| <a name="input_prom_cpu_mem_limits"></a> [prom\_cpu\_mem\_limits](#input\_prom\_cpu\_mem\_limits) | n/a | `string` | `"4Gi"` | no |
| <a name="input_prom_cpu_mem_request"></a> [prom\_cpu\_mem\_request](#input\_prom\_cpu\_mem\_request) | n/a | `string` | `"2Gi"` | no |
| <a name="input_prom_helm_chart"></a> [prom\_helm\_chart](#input\_prom\_helm\_chart) | n/a | `string` | `"kube-prometheus-stack"` | no |
| <a name="input_prom_helm_release_name"></a> [prom\_helm\_release\_name](#input\_prom\_helm\_release\_name) | n/a | `string` | `"kube-prometheus-stack"` | no |
| <a name="input_prom_helm_repo_url"></a> [prom\_helm\_repo\_url](#input\_prom\_helm\_repo\_url) | n/a | `string` | `"https://prometheus-community.github.io/helm-charts"` | no |
| <a name="input_prom_replicas_number"></a> [prom\_replicas\_number](#input\_prom\_replicas\_number) | n/a | `string` | `"1"` | no |
| <a name="input_prom_retention"></a> [prom\_retention](#input\_prom\_retention) | n/a | `string` | `"100d"` | no |
| <a name="input_prom_storage_class_name"></a> [prom\_storage\_class\_name](#input\_prom\_storage\_class\_name) | n/a | `string` | `"default"` | no |
| <a name="input_prom_storage_resource_request"></a> [prom\_storage\_resource\_request](#input\_prom\_storage\_resource\_request) | n/a | `string` | `"64Gi"` | no |
| <a name="input_prometheus_stack_version"></a> [prometheus\_stack\_version](#input\_prometheus\_stack\_version) | n/a | `string` | `"57.1.0"` | no |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | n/a | `string` | `""` | no |
| <a name="input_publicip_new_or_existing_or_none"></a> [publicip\_new\_or\_existing\_or\_none](#input\_publicip\_new\_or\_existing\_or\_none) | n/a | `string` | `"new"` | no |
| <a name="input_publicip_resource_group"></a> [publicip\_resource\_group](#input\_publicip\_resource\_group) | n/a | `string` | `""` | no |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | n/a | `number` | `6379` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | n/a | `string` | `""` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | Values for the persistent volume and persistent volume claims when in <br>  a bare metal context and provisioner is set to local-path.<br>  If a provisioner is available, set the provisioner variable to the <br>  value of the StorageClass for this provisioner. | <pre>list(object({<br>    name         = string<br>    storage      = string<br>    labels       = map(string)<br>    access_modes = list(string)<br>    path         = string<br>  }))</pre> | <pre>[<br>  {<br>    "access_modes": [<br>      "ReadWriteOnce"<br>    ],<br>    "labels": {<br>      "cosmotech.com/db": "loki"<br>    },<br>    "name": "loki",<br>    "path": "/mnt/loki-storage",<br>    "storage": "8Gi"<br>  },<br>  {<br>    "access_modes": [<br>      "ReadWriteOnce"<br>    ],<br>    "labels": {<br>      "cosmotech.com/db": "grafana"<br>    },<br>    "name": "grafana",<br>    "path": "/mnt/grafana-storage",<br>    "storage": "8Gi"<br>  }<br>]</pre> | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | n/a | `string` | `"default"` | no |
| <a name="input_temporary_name_for_rotation_system_pool"></a> [temporary\_name\_for\_rotation\_system\_pool](#input\_temporary\_name\_for\_rotation\_system\_pool) | n/a | `string` | `"systemrotation"` | no |
| <a name="input_tenant_name"></a> [tenant\_name](#input\_tenant\_name) | n/a | `string` | `"phoenix"` | no |
| <a name="input_tf_access_key"></a> [tf\_access\_key](#input\_tf\_access\_key) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_access\_key="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tf_blob_name"></a> [tf\_blob\_name](#input\_tf\_blob\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_blob\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tf_container_name"></a> [tf\_container\_name](#input\_tf\_container\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_container\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tf_resource_group_name"></a> [tf\_resource\_group\_name](#input\_tf\_resource\_group\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_resource\_group\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tf_storage_account_name"></a> [tf\_storage\_account\_name](#input\_tf\_storage\_account\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_storage\_account\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tls_certificate_custom_certificate"></a> [tls\_certificate\_custom\_certificate](#input\_tls\_certificate\_custom\_certificate) | n/a | `string` | `""` | no |
| <a name="input_tls_certificate_custom_key"></a> [tls\_certificate\_custom\_key](#input\_tls\_certificate\_custom\_key) | n/a | `string` | `""` | no |
| <a name="input_tls_certificate_type"></a> [tls\_certificate\_type](#input\_tls\_certificate\_type) | n/a | `string` | `"let_s_encrypt"` | no |
| <a name="input_tls_secret_name"></a> [tls\_secret\_name](#input\_tls\_secret\_name) | n/a | `string` | `"letsencrypt-prod"` | no |
| <a name="input_user_app_role"></a> [user\_app\_role](#input\_user\_app\_role) | App role for azuread\_application | <pre>list(object({<br>    description  = string<br>    display_name = string<br>    id           = string<br>    role_value   = string<br>  }))</pre> | <pre>[<br>  {<br>    "description": "Workspace Writer",<br>    "display_name": "Workspace Writer",<br>    "id": "3f7ba86c-9940-43c8-a54d-0bfb706da136",<br>    "role_value": "Workspace.Writer"<br>  },<br>  {<br>    "description": "Workspace Reader",<br>    "display_name": "Workspace Reader",<br>    "id": "73ce2073-d918-4fe1-bc24-a4e69db07db8",<br>    "role_value": "Workspace.Reader"<br>  },<br>  {<br>    "description": "Solution Writer",<br>    "display_name": "Solution Writer",<br>    "id": "4f6e62a3-7f0a-4396-9620-ab465cd6577b",<br>    "role_value": "Solution.Writer"<br>  },<br>  {<br>    "description": "Solution Reader",<br>    "display_name": "Solution Reader",<br>    "id": "cf1a8625-38d9-417b-a5b9-a27c0014e740",<br>    "role_value": "Solution.Reader"<br>  },<br>  {<br>    "description": "ScenarioRun Writer",<br>    "display_name": "ScenarioRun Writer",<br>    "id": "ca8a2a19-3e09-48cc-976b-85ec9de4f68a",<br>    "role_value": "ScenarioRun.Writer"<br>  },<br>  {<br>    "description": "ScenarioRun Reader",<br>    "display_name": "ScenarioRun Reader",<br>    "id": "bdc8fe2a-73a8-477d-9efa-d8a37a4eb0f7",<br>    "role_value": "ScenarioRun.Reader"<br>  },<br>  {<br>    "description": "Scenario Writer",<br>    "display_name": "Scenario Writer",<br>    "id": "8fb9d03e-c46d-4003-a2a6-34d8b506e4e7",<br>    "role_value": "Scenario.Writer"<br>  },<br>  {<br>    "description": "Scenario Reader",<br>    "display_name": "Scenario Reader",<br>    "id": "e07dab65-4200-4502-8e36-79ca687320d9",<br>    "role_value": "Scenario.Reader"<br>  },<br>  {<br>    "description": "Organization Writer",<br>    "display_name": "Organization Writer",<br>    "id": "89d74995-095c-442f-bfda-06a77d3dbaa4",<br>    "role_value": "Organization.Writer"<br>  },<br>  {<br>    "description": "Organization Reader",<br>    "display_name": "Organization Reader",<br>    "id": "96213509-202a-497c-9f60-53c5f85268ec",<br>    "role_value": "Organization.Reader"<br>  },<br>  {<br>    "description": "Dataset Writer",<br>    "display_name": "Dataset Writer",<br>    "id": "c6e5d483-ec2c-4710-bf0c-78b0fda611dc",<br>    "role_value": "Dataset.Writer"<br>  },<br>  {<br>    "description": "Dataset Reader",<br>    "display_name": "Dataset Reader",<br>    "id": "454dc3f5-3012-45b3-bad6-975dae94338c",<br>    "role_value": "Dataset.Reader"<br>  },<br>  {<br>    "description": "Ability to write connectors",<br>    "display_name": "Connector Writer",<br>    "id": "e150953f-4835-4502-b95e-81d9ce97f591",<br>    "role_value": "Connector.Writer"<br>  },<br>  {<br>    "description": "Organization Viewer",<br>    "display_name": "Organization Viewer",<br>    "id": "ec5fdd3c-4df0-4c2f-bdad-0495a49f6e90",<br>    "role_value": "Organization.Viewer"<br>  },<br>  {<br>    "description": "Organization User",<br>    "display_name": "Organization User",<br>    "id": "bb9ffb73-997e-4320-8625-cfe45469aa3c",<br>    "role_value": "Organization.User"<br>  },<br>  {<br>    "description": "Organization Modeler",<br>    "display_name": "Organization Modeler",<br>    "id": "adcdb0a1-1588-4d2b-8657-364e544ac7e1",<br>    "role_value": "Organization.Modeler"<br>  },<br>  {<br>    "description": "Organization Administrator",<br>    "display_name": "Organization Admin",<br>    "id": "04b96a76-d77e-4a9d-967f-c55c857c478c",<br>    "role_value": "Organization.Admin"<br>  },<br>  {<br>    "description": "Organization Collaborator",<br>    "display_name": "Organization Collaborator",<br>    "id": "6f5ec4e3-1f2d-4502-837e-5d9754ea8acb",<br>    "role_value": "Organization.Collaborator"<br>  },<br>  {<br>    "description": "Ability to develop connectors",<br>    "display_name": "Connector Developer",<br>    "id": "428ab58e-ab61-4621-907c-d7908be72df7",<br>    "role_value": "Connector.Developer"<br>  },<br>  {<br>    "description": "Ability to read connectors",<br>    "display_name": "Connector Reader",<br>    "id": "2cd74037-3ccd-4ab7-929d-4afce87be2e4",<br>    "role_value": "Connector.Reader"<br>  },<br>  {<br>    "description": "Platform Administrator",<br>    "display_name": "Platform Admin",<br>    "id": "bb49d61f-8b6a-4a19-b5bd-06a29d6b8e60",<br>    "role_value": "Platform.Admin"<br>  }<br>]</pre> | no |
| <a name="input_vault_namespace"></a> [vault\_namespace](#input\_vault\_namespace) | n/a | `string` | `"vault"` | no |
| <a name="input_vault_secrets_operator_namespace"></a> [vault\_secrets\_operator\_namespace](#input\_vault\_secrets\_operator\_namespace) | n/a | `string` | `"vault-secrets-operator"` | no |
| <a name="input_vault_secrets_operator_vault_address"></a> [vault\_secrets\_operator\_vault\_address](#input\_vault\_secrets\_operator\_vault\_address) | n/a | `string` | `"http://vault.vault.svc.cluster.local:8200"` | no |
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