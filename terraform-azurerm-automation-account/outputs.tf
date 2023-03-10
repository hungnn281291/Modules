output "name" {
  description = "Specifies the name of the Automation Account"
  value       = azurerm_automation_account.this.name
}

output "id" {
  description = "Specifies the id of the Automation Account"
  value       = azurerm_automation_account.this.id
}

output "principal_id" {
  description = "The Principal ID associated with this Managed Service Identity"
  value       = length(azurerm_automation_account.this.identity) == 0 ? null : azurerm_automation_account.this.identity[0].principal_id
}

