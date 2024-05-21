module "create-ingress-nginx" {
  source = "./create-ingress-nginx"

  monitoring_namespace    = var.monitoring_namespace
  ingress_nginx_version   = var.ingress_nginx_version
  loadbalancer_ip         = var.loadbalancer_ip
  tls_secret_name         = local.tls_secret_name
  publicip_resource_group = var.publicip_resource_group

  depends_on = [
    module.create-prometheus-stack
  ]
}

module "create-prometheus-stack" {
  source = "./create-prometheus-stack"

  count                = var.create_prometheus_stack ? 1 : 0
  namespace            = var.namespace
  monitoring_namespace = var.monitoring_namespace
  api_dns_name         = var.api_dns_name
  tls_secret_name      = local.tls_secret_name
  redis_admin_password = random_password.redis_admin_password.result
  prom_admin_password  = random_password.prom_admin_password.result
  prom_cpu_mem_limits  = var.prom_cpu_mem_limits
  prom_cpu_mem_request = var.prom_cpu_mem_request
}

module "cert-manager" {
  source = "./create-cert-manager"

  count                    = var.tls_certificate_type != "none" ? 1 : 0
  tls_certificate_type     = var.tls_certificate_type
  monitoring_namespace     = var.monitoring_namespace
  cluster_issuer_email     = var.cluster_issuer_email
  cluster_issuer_name      = var.cluster_issuer_name
  tls_secret_name          = local.tls_secret_name
  api_dns_name             = var.api_dns_name
  certificate_cert_content = var.certificate_cert_content
  certificate_key_content  = var.certificate_key_content

  depends_on = [module.create-ingress-nginx]
}

module "loki" {
  source = "./create-loki"

  namespace            = var.namespace
  monitoring_namespace = var.monitoring_namespace

  loki_release_name                    = var.loki_release_name
  loki_persistence_memory              = var.loki_persistence_memory
  loki_retention_period                = var.loki_retention_period
  helm_repo_url                        = var.helm_repo_url
  helm_chart                           = var.helm_chart
  loki_max_entries_limet_per_query     = var.loki_max_entries_limet_per_query
  grafana_loki_compatibility_image_tag = var.grafana_loki_compatibility_image_tag
}
