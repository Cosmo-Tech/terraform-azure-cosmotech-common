module "cosmotech-prerequisites" {
  source = "./azure-common-resources"

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  tenant_name     = var.tenant_name
  location        = var.location

  resource_group   = local.resource_group
  cluster_name     = local.cluster_name
  deployment_type  = var.deployment_type
  image_path       = var.image_path
  platform_url     = var.platform_url
  identifier_uri   = var.identifier_uri
  owner_list       = var.owner_list
  audience         = var.audience
  api_version_path = var.api_version_path

  user_app_role  = var.user_app_role
  create_secrets = var.create_secrets
  create_babylon = var.create_babylon
  cost_center    = var.cost_center

  # publicip
  create_publicip         = var.publicip_new_or_existing_or_none == "new" ? true : false
  create_dnsrecord        = var.create_dnsrecord
  publicip_resource_group = var.deployment_type != "ARM" ? local.resource_group : var.publicip_resource_group
  project_stage           = var.project_stage
  project_name            = var.project_name
  customer_name           = var.customer_name
  dns_record              = var.dns_record
  dns_zone_name           = var.dns_zone_name
  dns_zone_rg             = var.dns_zone_rg

  # network common
  network_client_id     = var.network_client_id
  network_client_secret = var.network_client_secret
  network_sp_object_id  = var.network_sp_object_id

  # vnet
  vnet_name           = var.vnet_name
  vnet_new            = var.vnet_new
  subnet_name         = var.subnet_name
  vnet_iprange        = var.virtual_network_address_prefix
  subnet_iprange      = var.virtual_network_subnet_address_prefix
  vnet_resource_group = var.vnet_resource_group

  # privatelink dns
  private_dns_name_blob     = var.private_dns_name_blob
  private_dns_name_queue    = var.private_dns_name_queue
  private_dns_name_table    = var.private_dns_name_table
  private_dns_name_adt      = var.private_dns_name_adt
  private_dns_name_eventhub = var.private_dns_name_eventhub

  kubernetes_version                          = var.kubernetes_version
  kubernetes_max_db_instances                 = var.kubernetes_max_db_instances
  kubernetes_min_db_instances                 = var.kubernetes_min_db_instances
  kubernetes_max_services_instances           = var.kubernetes_max_services_instances
  kubernetes_max_monitoring_instances         = var.kubernetes_max_monitoring_instances
  kubernetes_min_monitoring_instances         = var.kubernetes_min_monitoring_instances
  kubernetes_max_highmemory_compute_instances = var.kubernetes_max_highmemory_compute_instances
  kubernetes_max_highcpu_compute_instances    = var.kubernetes_max_highcpu_compute_instances
  kubernetes_max_basic_compute_instances      = var.kubernetes_max_basic_compute_instances
  kubernetes_db_type                          = var.kubernetes_db_type
  kubernetes_services_type                    = var.kubernetes_services_type
  kubernetes_monitoring_type                  = var.kubernetes_monitoring_type
  kubernetes_highmemory_compute_type          = var.kubernetes_highmemory_compute_type
  kubernetes_highcpu_compute_type             = var.kubernetes_highcpu_compute_type
  kubernetes_basic_compute_type               = var.kubernetes_basic_compute_type
  kubernetes_nodepool_system_type             = var.kubernetes_nodepool_system_type
  kubernetes_network_plugin                   = var.kubernetes_network_plugin
  temporary_name_for_rotation_system_pool     = var.temporary_name_for_rotation_system_pool
  kubernetes_min_services_instances           = var.kubernetes_min_services_instances
  kubernetes_min_highmemory_compute_instances = var.kubernetes_min_highmemory_compute_instances
  kubernetes_min_highcpu_compute_instances    = var.kubernetes_min_highcpu_compute_instances
  kubernetes_min_basic_compute_instances      = var.kubernetes_min_basic_compute_instances
  kubernetes_min_system_instances             = var.kubernetes_min_system_instances
  kubernetes_max_system_instances             = var.kubernetes_max_system_instances
  kubernetes_max_monitoring_pods              = var.kubernetes_max_monitoring_pods
  kubernetes_max_db_pods                      = var.kubernetes_max_db_pods
  kubernetes_max_highmemory_pods              = var.kubernetes_max_highmemory_pods
  kubernetes_max_services_pods                = var.kubernetes_max_services_pods
  kubernetes_max_basic_pods                   = var.kubernetes_max_basic_pods
  kubernetes_max_highcpu_pods                 = var.kubernetes_max_highcpu_pods
  kubernetes_max_system_pods                  = var.kubernetes_max_system_pods
  kubernetes_basic_enable_auto_scaling        = var.kubernetes_basic_enable_auto_scaling
  kubernetes_db_enable_auto_scaling           = var.kubernetes_db_enable_auto_scaling
  kubernetes_highcpu_enable_auto_scaling      = var.kubernetes_highcpu_enable_auto_scaling
  kubernetes_highmemory_enable_auto_scaling   = var.kubernetes_highmemory_enable_auto_scaling
  kubernetes_monitoring_enable_auto_scaling   = var.kubernetes_monitoring_enable_auto_scaling
  kubernetes_services_enable_auto_scaling     = var.kubernetes_services_enable_auto_scaling
  kubernetes_system_enable_auto_scaling       = var.kubernetes_system_enable_auto_scaling
  kubernetes_db_os_disk_size                  = var.kubernetes_db_os_disk_size
  kubernetes_highcpu_os_disk_size             = var.kubernetes_highcpu_os_disk_size
  kubernetes_basic_os_disk_size               = var.kubernetes_basic_os_disk_size
  kubernetes_highmemory_os_disk_size          = var.kubernetes_highmemory_os_disk_size
  kubernetes_monitoring_os_disk_size          = var.kubernetes_monitoring_os_disk_size
  kubernetes_services_os_disk_size            = var.kubernetes_services_os_disk_size
  kubernetes_system_os_disk_size              = var.kubernetes_system_os_disk_size
  kubernetes_nodepool_system_name             = var.kubernetes_nodepool_system_name
}

module "cosmotech-platform" {
  source  = "Cosmo-Tech/cosmotech-common/kubernetes"
  version = "1.1.3"

  is_bare_metal            = var.is_bare_metal
  namespace                = var.namespace
  monitoring_namespace     = var.monitoring_namespace
  api_dns_name             = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_fqdn : var.fqdn
  resource_group           = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_ip_resource_group : var.resource_group
  # kube_config              = module.cosmotech-prerequisites.out_aks_phoenix_config

  # keycloak
  create_keycloak             = var.create_keycloak  
  keycloak_admin_user         = var.keycloak_admin_user
  keycloak_postgres_user      = var.keycloak_postgres_user
  keycloak_helm_repo          = var.keycloak_helm_repo
  keycloak_helm_chart         = var.keycloak_helm_chart
  keycloak_helm_chart_version = var.keycloak_helm_chart_version
  postgres_helm_repo          = var.postgres_helm_repo
  postgres_helm_chart         = var.postgres_helm_chart
  postgres_helm_chart_version = var.postgres_helm_chart_version

  # cert-manager
  tls_secret_name                = local.tls_secret_name
  tls_certificate_type           = var.tls_certificate_type
  cluster_issuer_email           = var.cluster_issuer_email
  cluster_issuer_name            = var.cluster_issuer_name  
  cluster_issuer_server          = var.cluster_issuer_server
  cert_manager_namespace         = var.cert_manager_namespace
  cert_manager_helm_repo_url     = var.cert_manager_helm_repo_url
  cert_manager_helm_release_name = var.cert_manager_helm_release_name
  cert_manager_version           = var.cert_manager_version
  certificate_cert_content       = var.tls_certificate_custom_certificate
  certificate_key_content        = var.tls_certificate_custom_key

  # ingress-nginx
  ingress_nginx_version           = var.ingress_nginx_version
  ingress_nginx_helm_repo_url     = var.ingress_nginx_helm_repo_url
  ingress_nginx_helm_release_name = var.ingress_nginx_helm_release_name
  ingress_nginx_namespace         = var.ingress_nginx_namespace
  loadbalancer_ip                 = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_public_ip : var.loadbalancer_ip
  publicip_resource_group         = var.deployment_type != "ARM" ? module.cosmotech-prerequisites.out_ip_resource_group : var.publicip_resource_group
  ingress_nginx_replica_count     = var.ingress_nginx_replica_count

  # loki
  loki_namespace                       = var.loki_namespace
  loki_release_name                    = var.loki_release_name
  loki_persistence_memory              = var.loki_persistence_memory
  loki_retention_period                = var.loki_retention_period
  helm_repo_url                        = var.loki_helm_repo_url
  helm_chart                           = var.loki_helm_chart
  loki_max_entries_limet_per_query     = var.loki_max_entries_limet_per_query
  grafana_loki_compatibility_image_tag = var.grafana_loki_compatibility_image_tag
  resources                            = var.resources

  # prometheus
  create_prometheus_stack       = var.create_prometheus_stack
  prom_namespace                = var.prom_namespace
  prometheus_stack_version      = var.prometheus_stack_version
  prom_helm_chart               = var.prom_helm_chart
  prom_helm_repo_url            = var.prom_helm_repo_url
  prom_helm_release_name        = var.prom_helm_release_name
  prom_cpu_mem_limits           = var.prom_cpu_mem_limits
  prom_cpu_mem_request          = var.prom_cpu_mem_request
  prom_storage_resource_request = var.prom_storage_resource_request
  prom_storage_class_name       = var.prom_storage_class_name
  prom_replicas_number          = var.prom_replicas_number
  prom_retention                = var.prom_retention
  redis_port                    = var.redis_port

}
