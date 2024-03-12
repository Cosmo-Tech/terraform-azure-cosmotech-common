output "out_public_ip" {
  value = var.create_publicip ? azurerm_public_ip.publicip[0].ip_address : null
}

output "out_public_ip_name" {
  value = var.create_publicip ? azurerm_public_ip.publicip[0].name : null
}

output "out_ip_resource_group" {
  value = var.publicip_resource_group.name
}

output "out_fqdn" {
  value = var.create_dnsrecord ? "${azurerm_dns_a_record.platform_fqdn[0].name}.${var.dns_zone_name}" : null
}