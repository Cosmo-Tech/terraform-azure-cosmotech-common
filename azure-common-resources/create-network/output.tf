output "out_subnet_id" {
  value = "${local.subscription}/${local.rg_name}/providers/Microsoft.Network/virtualNetworks/${local.subnetname}"
}

output "out_vnet_id" {
  value = "${local.subscription}/${local.rg_name}/providers/Microsoft.Network/virtualNetworks/${azurerm_virtual_network.network_vnet.name}"
}

output "out_network_name" {
  value = azurerm_virtual_network.network_vnet.name
}
