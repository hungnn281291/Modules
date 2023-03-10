output "id" {
  description = "The ID of the created shared image gallery."
  value       = azurerm_shared_image_gallery.this.id
}

output "name" {
  description = "The unique name of the created shared image gallery."
  value       = azurerm_shared_image_gallery.this.name
}
