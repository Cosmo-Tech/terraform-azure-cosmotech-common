locals {
  subscription = "/subscriptions/${var.subscription_id}"
  rg_name      = "resourceGroups/${var.resource_group}"
  subnet_name  = "${azurerm_virtual_network.platform_vnet.name}/subnets/${var.subnet_name}"
  vnet_name    = azurerm_virtual_network.platform_vnet.name
}

output "out_subnet_id" {
  value = "${local.subscription}/${local.rg_name}/providers/Microsoft.Network/virtualNetworks/${local.subnet_name}"
}

output "out_vnet_id" {
  value = "${local.subscription}/${local.rg_name}/providers/Microsoft.Network/virtualNetworks/${local.vnet_name}"
}

output "out_platform_vnet_name" {
  value = local.vnetname
}