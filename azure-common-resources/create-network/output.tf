locals {
  subscription = "/subscriptions/${var.subscription_id}"
  rg_name      = "resourceGroups/${var.resource_group}"
  vnet_name    = "${azurerm_virtual_network.platform_vnet.name}/subnets/${var.subnet_name}"
}

output "out_subnet_id" {
  value = "${local.subscription}/${local.rg_name}/providers/Microsoft.Network/virtualNetworks/${local.vnet_name}"
}