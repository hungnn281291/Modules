locals {
  missing_tenant = var.tenant_id == null
  client_config = {
    tenant_id = (
      local.missing_tenant
      ? data.azuread_client_config.current.tenant_id
      : var.tenant_id
    )
  }

  blobs = {
    for b in var.blobs : b.name => merge({
      type         = "Block"
      size         = 0
      content_type = "application/octet-stream"
      source_file  = null
      source_uri   = null
      metadata     = {}
    }, b)
  }
}

data "azuread_client_config" "current" {}
resource "azurerm_storage_account" "this" {
  count                           = var.IsKerbos == false ? 1 : 0
  resource_group_name             = var.resource_group_name
  name                            = var.name
  location                        = var.location
  account_kind                    = var.account_kind
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  edge_zone                       = var.edge_zone
  enable_https_traffic_only       = true
  min_tls_version                 = var.min_tls_version
  shared_access_key_enabled       = var.shared_access_key_enabled
  tags                            = merge(local.tags, var.tags)
  large_file_share_enabled        = var.large_file_share_enabled
  nfsv3_enabled                   = var.nfsv3_enabled

  blob_properties {
    change_feed_enabled = var.change_feed_enabled
    dynamic "cors_rule" {
      for_each = var.cors_rule_enabled == true ? [1] : []
      content {
        allowed_headers    = var.allowed_headers
        allowed_methods    = var.allowed_methods
        allowed_origins    = var.allowed_origins
        exposed_headers    = var.exposed_headers
        max_age_in_seconds = var.max_age_in_seconds
      }
    }
    dynamic "delete_retention_policy" {
      for_each = var.soft_delete_blob_enabled == true ? [1] : []
      content {
        days = var.delete_retention_policy_days
      }
    }
    dynamic "container_delete_retention_policy" {
      for_each = var.soft_delete_container_enabled == true ? [1] : []
      content {
        days = var.container_delete_retention_policy_days
      }
    }
    last_access_time_enabled = var.last_access_time_enabled
    versioning_enabled       = var.versioning_enabled
  }
  share_properties {
    smb {
      versions = ["SMB3.0"]
    }
    dynamic "retention_policy" {
      for_each = var.soft_delete_share_enabled == true ? [1] : []
      content {
        days = var.file_share_delete_retention_policy_days
      }
    }
  }
  dynamic "identity" {
    for_each = var.assign_identity == false ? [] : tolist([var.assign_identity])
    content {
      type = "SystemAssigned"
    }
  }

  dynamic "static_website" {
    for_each = var.static_website == null ? [] : [var.static_website]
    content {
      error_404_document = static_website.value["error_404_document"]
      index_document     = static_website.value["index_document"]
    }
  }

  lifecycle {
    ignore_changes = [
      customer_managed_key
    ]
  }
}

resource "azurerm_key_vault_secret" "this" {
  count           = var.persist_access_key == true && var.IsKerbos == false ? 1 : 0
  name            = "${azurerm_storage_account.this[0].name}-access-key"
  value           = azurerm_storage_account.this[0].primary_access_key
  key_vault_id    = var.key_vault_id
  content_type    = var.content_type
  expiration_date = timeadd(formatdate("YYYY-MM-DD'T'hh:mm:ssZ", timestamp()), "8760h")

  depends_on = [azurerm_role_assignment.this]
}

resource "azurerm_key_vault_key" "this" {
  count           = var.cmk_enabled == true && var.IsKerbos == false ? 1 : 0
  name            = format("%s-key", azurerm_storage_account.this[0].name)
  key_vault_id    = var.key_vault_id
  key_type        = var.key_type
  key_size        = var.key_size
  expiration_date = timeadd(formatdate("YYYY-MM-DD'T'hh:mm:ssZ", timestamp()), "8760h")

  key_opts = [
    "decrypt", "encrypt", "sign",
    "unwrapKey", "verify", "wrapKey"
  ]

  depends_on = [azurerm_storage_account.this, azurerm_role_assignment.this]
}

resource "azurerm_storage_account_customer_managed_key" "this" {
  count              = var.cmk_enabled == true && var.IsKerbos == false ? 1 : 0
  storage_account_id = azurerm_storage_account.this[0].id
  key_vault_id       = var.key_vault_id
  key_name           = azurerm_key_vault_key.this[0].name
  key_version        = azurerm_key_vault_key.this[0].version
}

resource "azurerm_storage_account_network_rules" "this" {
  depends_on = [
    azurerm_storage_account.this
  ]
  storage_account_id         = var.IsKerbos == false ? azurerm_storage_account.this[0].id : azapi_resource.kerstorage[0].id
  default_action             = var.network_rules.default_action
  ip_rules                   = var.network_rules.ip_rules
  virtual_network_subnet_ids = var.network_rules.virtual_network_subnet_ids
  bypass                     = ["AzureServices"] # Requires security architecture approval
}

resource "azurerm_role_assignment" "this" {
  count                = var.cmk_enabled == true && var.IsKerbos == false ? 1 : 0
  scope                = var.key_vault_id
  role_definition_name = var.role_definition_name
  principal_id         = azurerm_storage_account.this[0].identity[0].principal_id
  depends_on = [
    azurerm_storage_account.this
  ]
}

resource "azurerm_role_assignment" "rbac_storage_blob" {
  count                = var.IsKerbos == false ? 1 : 0
  principal_id         = data.azuread_client_config.current.object_id
  role_definition_name = "Storage Blob Data Contributor"
  scope                = azurerm_storage_account.this[0].id
}

resource "azurerm_storage_container" "this" {
  for_each = var.containers

  name                  = each.value["name"]
  storage_account_name  = azurerm_storage_account.this[0].name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.this
  ]
}

resource "azurerm_storage_blob" "this" {
  for_each = local.blobs

  name                   = each.value["name"]
  storage_account_name   = azurerm_storage_account.this[0].name
  storage_container_name = each.value["storage_container_name"]
  type                   = each.value["type"]
  size                   = lookup(each.value, "size", null)
  content_type           = lookup(each.value, "content_type", null)
  source_uri             = lookup(each.value, "source_uri", null)
  metadata               = lookup(each.value, "metadata", null)
  parallelism            = lookup(each.value, "parallelism", 8)

  depends_on = [
    azurerm_storage_container.this
  ]
}

resource "azurerm_storage_queue" "this" {
  for_each = var.queues

  name                 = each.value["name"]
  storage_account_name = azurerm_storage_account.this[0].name
  metadata             = lookup(each.value, "metadata", null)
}

resource "azurerm_storage_share" "this" {
  for_each = var.file_shares

  name                 = each.value["name"]
  storage_account_name = var.IsKerbos == false ? azurerm_storage_account.this[0].name : azapi_resource.kerstorage[0].name
  quota                = coalesce(lookup(each.value, "quota"), 110)
  enabled_protocol     = "SMB"
  metadata             = lookup(each.value, "metadata", null)
  access_tier          = lookup(each.value, "access_tier", "TransactionOptimized")
  depends_on = [
    azurerm_storage_container.this
  ]
}

resource "azurerm_storage_table" "this" {
  for_each = var.tables

  name                 = each.value["name"]
  storage_account_name = azurerm_storage_account.this[0].name
}

resource "azapi_resource" "kerstorage" {
  count     = var.IsKerbos == true ? 1 : 0
  parent_id = var.parent_id
  location  = var.location
  type      = "Microsoft.Storage/storageAccounts@2022-09-01"
  name      = var.name
  body = jsonencode({
    kind = "FileStorage"
    sku = {
      name = "Premium_LRS"
    }
    identity = {
      type = "SystemAssigned"
    }
    properties = {
      minimumTlsVersion        = "TLS1_2"
      largeFileSharesState     = "Enabled"
      supportsHttpsTrafficOnly = true
      allowSharedKeyAccess     = var.shared_access_key_enabled  
      allowBlobPublicAccess    = false
      azureFilesIdentityBasedAuthentication = {
        directoryServiceOptions = "AADKERB"
        activeDirectoryProperties = {
          domainGuid = var.domainGuid
          domainName = var.domainName
        }

      }
    }
  })
  response_export_values = ["*"]
}
