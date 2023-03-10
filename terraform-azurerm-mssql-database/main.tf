locals {
  serverless = split("_", var.sku_name)[1] == "S" # Serverless SKU have an a single S in second element of the sku name. EG: GP_S_Gen5_2
}

resource "azurerm_mssql_database" "this" {
  name                                = var.mssql_database_name
  server_id                           = var.mssql_server_id
  license_type                        = local.serverless ? null : var.license_type # Serverless Database SKU Types dont support a license_type
  max_size_gb                         = var.max_size_gb
  sku_name                            = var.sku_name
  zone_redundant                      = true
  transparent_data_encryption_enabled = true
  tags                                = merge(local.tags, var.tags)
  min_capacity                        = local.serverless ? var.min_capacity : null # Serverless Database SKU require a min_capacity property
  auto_pause_delay_in_minutes         = local.serverless ? -1 : null               # Not settable in Serverless Database SKU but if null still fail saying it cannot be 0

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_mssql_database_extended_auditing_policy" "this" { # ASQ_LOG_001
  database_id       = azurerm_mssql_database.this.id
  storage_endpoint  = var.blob_endpoint
  retention_in_days = 90
}
