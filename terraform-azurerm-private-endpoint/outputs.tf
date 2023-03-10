output "id" {
  description = "The ID of the Private Endpoint."
  value       = azurerm_private_endpoint.this.id
}

output "name" {
  description = "The Name of the Private Endpoint."
  value       = azurerm_private_endpoint.this.name
}

output "network_interface" {
  description = "The ID and Name of the network interface associated with the private_endpoint."
  value       = azurerm_private_endpoint.this.network_interface
}

output "private_dns_zone_group" {
  description = "The ID of the Private DNS Zone Group."
  value       = azurerm_private_endpoint.this.private_dns_zone_group
}

output "custom_dns_configs" {
  description = "The fully qualified domain name and list of all IP Addresses that map to the private_endpoint fqdn."
  value       = azurerm_private_endpoint.this.custom_dns_configs
}

output "private_dns_zone_configs" {
  description = "The Name , ID , list of IP Addresses of the Private DNS Zone config"
  value       = azurerm_private_endpoint.this.private_dns_zone_configs
}

output "private_service_connection" {
  description = "The private IP address associated with the private endpoint"
  value       = azurerm_private_endpoint.this.private_service_connection
}

output "ip_configuration" {
  description = "Name,static IP address set by this configuration of the IP Configuration.The subresource this IP address applies to, which corresponds to the group_id."
  value       = azurerm_private_endpoint.this.ip_configuration
}
