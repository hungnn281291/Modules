resource "azurerm_application_insights" "this" {
  name                                  = var.application_insight_name
  location                              = var.location
  resource_group_name                   = var.resource_group_name
  application_type                      = var.application_type
  tags                                  = merge(local.tags, var.tags)
  daily_data_cap_in_gb                  = var.daily_data_cap_in_gb
  daily_data_cap_notifications_disabled = var.daily_data_cap_notifications_disabled
  retention_in_days                     = var.retention_in_days
  sampling_percentage                   = var.sampling_percentage
  disable_ip_masking                    = var.disable_ip_masking
  workspace_id                          = var.workspace_id
  local_authentication_disabled         = var.local_authentication_disabled
  internet_ingestion_enabled            = var.internet_ingestion_enabled
  internet_query_enabled                = var.internet_query_enabled
  force_customer_storage_for_profiler   = var.force_customer_storage_for_profiler

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
