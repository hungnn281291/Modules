output "name" {
  description = "The name of the created Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.this.name
}

output "id" {
  description = "The Log Analytics Workspace ID."
  value       = azurerm_log_analytics_workspace.this.id
}

output "primary_shared_key" {
  description = "The Primary shared key for the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.this.primary_shared_key
}

output "secondary_shared_key" {
  description = "The Secondary shared key for the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.this.secondary_shared_key
}

output "workspace_id" {
  description = "The Workspace (or Customer) ID for the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.this.workspace_id
}
