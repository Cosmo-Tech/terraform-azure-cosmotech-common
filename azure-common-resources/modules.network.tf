module "create-network" {
  source = "./create-network"

  count = var.vnet_new == "new" ? 1 : 0

  resource_group      = local.resource_group
  vnet_resource_group = local.vnet_resource_group
  network_name        = var.network_name
  vnet_iprange        = var.vnet_iprange
  location            = var.location
  customer_name       = var.customer_name
  cost_center         = var.cost_center
  project_stage       = var.project_stage
  project_name        = var.project_name
  subscription_id     = var.subscription_id
  subnet_iprange      = var.subnet_iprange
  subnet_name         = var.subnet_name
  network_publicip_id = var.network_publicip_id
  network_sp_objectid = module.create-platform-prerequisite.0.out_network_sp_object_id

  depends_on = [module.create-platform-prerequisite]
}