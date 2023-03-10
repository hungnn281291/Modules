resource "azurerm_private_endpoint" "this" {
  name                          = var.privateendpoint_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  subnet_id                     = var.subnet_id
  tags                          = merge(local.tags, var.tags)
  custom_network_interface_name = var.custom_network_interface_name

  private_dns_zone_group {
    name                 = var.private_dns_zone_group_name
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  dynamic "ip_configuration" {
    for_each = var.private_ip_address == null ? [] : [1]
    content {
      name               = var.ipconfiguration_name
      private_ip_address = var.private_ip_address
      subresource_name   = var.subresource_name
      member_name        = var.member_name
    }
  }

  private_service_connection {
    name                           = "${var.privateendpoint_name}-connection"
    private_connection_resource_id = var.private_connection_resource_id
    is_manual_connection           = var.is_manual_connection
    subresource_names              = var.subresource_names
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
