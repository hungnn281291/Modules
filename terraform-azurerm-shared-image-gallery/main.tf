resource "azurerm_shared_image_gallery" "this" {
  name                = var.shared_image_gallery_name
  resource_group_name = var.resource_group_name
  location            = var.location
  description         = var.description
  tags                = merge(local.tags, var.tags)

  lifecycle {
    prevent_destroy = true  #ACG_TDS_005
    ignore_changes  = [
      tags
    ]
  }
}