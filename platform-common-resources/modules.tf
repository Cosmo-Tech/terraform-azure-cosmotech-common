module "create-ingress-nginx" {
  source = "./create-ingress-nginx"

  monitoring_namespace    = var.monitoring_namespace
  ingress_nginx_version   = var.ingress_nginx_version
  loadbalancer_ip         = var.loadbalancer_ip
  tls_secret_name         = local.tls_secret_name
  publicip_resource_group = var.publicip_resource_group

  depends_on = [
    module.create-prometheus-stack, module.cert-manager
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
}
