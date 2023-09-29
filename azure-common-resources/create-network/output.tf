output "out_vnet" {
  value = var.create_vnet ? azurerm_virtual_network.platform_vnet[0].name : null
}

output "out_subnet_name" {
  value = local.subnet_name
}

locals {
  subscription = "/subscriptions/${var.subscription_id}"
  rg_name      = "resourceGroups/${var.resource_group}"
  vnet_name    = "${var.create_vnet ? azurerm_virtual_network.platform_vnet[0].name : null}/subnets/${local.subnet_name}"
}

output "out_subnet_id" {
  value = "${local.subscription}/${local.rg_name}/providers/Microsoft.Network/virtualNetworks/${local.vnet_name}"
}

output "out_private_dns_zone_id" {
  value = azurerm_private_dns_zone.private_dns.id
}