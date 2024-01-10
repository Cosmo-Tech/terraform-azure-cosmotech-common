output "out_public_ip" {
  value = azurerm_public_ip.publicip[0].ip_address
}

output "out_public_ip_name" {
  value = azurerm_public_ip.publicip[0].name
}

output "out_ip_resource_group" {
  value = data.azurerm_resource_group.publicip_rg.name
}

output "out_fqdn" {
  value = var.create_dnsrecord ? "${azurerm_dns_a_record.platform_fqdn[0].name}.${var.dns_zone_name}" : null
}