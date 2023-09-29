module "create-platform-prerequisite" {
  source = "./create-platform-prerequisites"

  count            = var.deployment_type != "ARM" ? 1 : 0
  tenant_id        = var.tenant_id
  subscription_id  = var.subscription_id
  client_id        = var.client_id
  client_secret    = var.client_secret
  platform_url     = var.platform_url
  identifier_uri   = var.identifier_uri
  project_stage    = var.project_stage
  project_name     = var.project_name
  owner_list       = var.owner_list
  audience         = var.audience
  location         = var.location
  resource_group   = var.resource_group
  create_publicip  = var.create_publicip
  create_dnsrecord = var.create_dnsrecord
  dns_zone_name    = var.dns_zone_name
  dns_zone_rg      = var.dns_zone_rg
  dns_record       = var.dns_record
  create_vnet      = var.create_vnet
  vnet_iprange     = var.vnet_iprange
  api_version_path = var.api_version_path
  customer_name    = var.customer_name
  user_app_role    = var.user_app_role
  image_path       = var.image_path
  cost_center      = var.cost_center
}


module "create-network" {
  source = "./create-network"

  resource_group   = local.resource_group
  vnet_iprange     = var.vnet_iprange
  create_vnet      = var.create_vnet
  location         = var.location
  customer_name    = var.customer_name
  cost_center      = var.cost_center
  project_stage    = var.project_stage
  project_name     = var.project_name
  adt_principal_id = local.adt_principal_id
  subscription_id  = var.subscription_id

  depends_on = [module.create-platform-prerequisite]
}

module "create-cluster" {
  source = "./create-cluster"

  location       = var.location
  resource_group = var.resource_group
  client_secret  = local.platform_password
  cluster_name   = var.cluster_name
  project_stage  = var.project_stage
  project_name   = var.project_name
  customer_name  = var.customer_name
  cost_center    = var.cost_center
  application_id = local.platform_clientid
  subnet_id      = local.subnet_id

  depends_on = [
    module.create-platform-prerequisite, module.create-network
  ]
}