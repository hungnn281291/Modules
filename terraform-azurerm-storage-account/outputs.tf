output "name" {
  description = "The name of the resource created."
  value       = one(azurerm_storage_account.this[*].name)
}

output "id" {
  description = "The id of the resource created."
  value       = one(azurerm_storage_account.this[*].id)
}

output "primary_connection_string" {
  description = "The primary connection string of the storage account created."
  value       = one(azurerm_storage_account.this[*].primary_connection_string)
  sensitive   = true
}

output "secondary_connection_string" {
  description = "The secondary connection string of the storage account created."
  value       = one(azurerm_storage_account.this[*].secondary_connection_string)
  sensitive   = true
}

output "primary_access_key" {
  description = "The primary access key of the storage account created."
  value       = one(azurerm_storage_account.this[*].primary_access_key)
  sensitive   = true
}

output "secondary_access_key" {
  description = "The secondary access key of the storage account created."
  value       = one(azurerm_storage_account.this[*].secondary_access_key)
  sensitive   = true
}

output "storage_identity_principal_id" {
  description = "The Principal ID for the Service Principal associated with the Identity of this Storage Account"
  value       = one(azurerm_storage_account.this[*].identity[*].principal_id)
}

output "container_ids" {
  value       = [for c in azurerm_storage_container.this : c.id]
  description = "The generated IDs for the Containers."
}

output "blob_ids" {
  value       = [for b in azurerm_storage_blob.this : b.id]
  description = "The generated IDs for the Blobs."
}

output "blob_urls" {
  value       = [for b in azurerm_storage_blob.this : b.url]
  description = "The generated URLs of the Blobs."
}

output "file_share_ids" {
  value       = [for s in azurerm_storage_share.this : s.id]
  description = "The generated IDs of the File shares."
}

output "file_share_urls" {
  value       = [for s in azurerm_storage_share.this : s.url]
  description = "The generated URLs of the File shares."
}

output "primary_blob_endpoint" {
  description = "The endpoint URL for blob storage in the primary location."
  value       = one(azurerm_storage_account.this[*].primary_blob_endpoint)
}

output "secondary_blob_endpoint" {
  description = "The endpoint URL for blob storage in the secondary location."
  value       = one(azurerm_storage_account.this[*].secondary_blob_endpoint)
}
