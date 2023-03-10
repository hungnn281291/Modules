resource "azurerm_log_analytics_workspace" "this" {
  name                               = var.name
  location                           = var.location
  resource_group_name                = var.resource_group_name
  sku                                = var.sku
  retention_in_days                  = var.retention_in_days < 90 ? 90 : var.retention_in_days
  tags                               = merge(local.tags, var.tags)
  internet_ingestion_enabled         = var.internet_ingestion_enabled
  internet_query_enabled             = var.internet_query_enabled
  daily_quota_gb                     = var.sku == "Free" ? null : var.daily_quota_gb
  reservation_capacity_in_gb_per_day = var.sku == "CapacityReservation" ? var.reservation_capacity_in_gb_per_day : null
  cmk_for_query_forced               = var.cmk_for_query_forced

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
