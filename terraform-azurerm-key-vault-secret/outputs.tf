output "id" {
  description = "The Key Vault Secret ID."
  value       = azurerm_key_vault_secret.this.id
}

output "version" {
  description = "The current version of the Key Vault Secret."
  value       = azurerm_key_vault_secret.this.version
}

output "versionless_id" {
  description = "The Base ID of the Key Vault Secret."
  value       = azurerm_key_vault_secret.this.versionless_id
}

output "resource_id" {
  description = "The (Versioned) ID for this Key Vault Secret. This property points to a specific version of a Key Vault Secret, as such using this won't auto-rotate values if used in other Azure Services."
  value       = azurerm_key_vault_secret.this.resource_id
}
