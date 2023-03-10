output "Plan_id" {
  description = "The ID of the Service Plan."
  value       = azurerm_service_plan.this.id
}

output "Plan_kind" {
  description = "A string representing the Kind of Service Plan."
  value       = azurerm_service_plan.this.kind
}

output "app_service_id" {
  description = "The ID of the Windows Web App."
  value       = azurerm_windows_web_app.this.id
}

output "app_service_principal_id" {
  description = "The Principal ID associated with this Managed Service Identity."
  value       = azurerm_windows_web_app.this.identity[0].principal_id
}

output "custom_domain_verification_id" {
  description = "The identifier used by App Service to perform domain ownership verification via DNS TXT record."
  value       = azurerm_windows_web_app.this.custom_domain_verification_id
}

output "default_hostname" {
  description = "The default hostname of the Windows Web App."
  value       = azurerm_windows_web_app.this.default_hostname
}

output "app_service_kind" {
  description = "The Kind value for this Windows Web App."
  value       = azurerm_windows_web_app.this.kind
}

output "outbound_ip_address_list" {
  description = "A list of outbound IP addresses - such as 52.23.25.3, 52.143.43.12"
  value       = azurerm_windows_web_app.this.outbound_ip_address_list
}

output "outbound_ip_addresses" {
  description = "A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12."
  value       = azurerm_windows_web_app.this.outbound_ip_addresses
}
