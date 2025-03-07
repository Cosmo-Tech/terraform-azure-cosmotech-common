module "create-privatedns" {
  source = "./create-privatedns"

  resource_group = local.resource_group
  vnet_id        = local.platform_vnet_id

  private_dns_name_blob     = var.private_dns_name_blob
  private_dns_name_adt      = var.private_dns_name_adt
  private_dns_name_queue    = var.private_dns_name_queue
  private_dns_name_table    = var.private_dns_name_table
  private_dns_name_eventhub = var.private_dns_name_eventhub

  depends_on = [
    module.create-platform-prerequisite,
    module.create-network
  ]
}