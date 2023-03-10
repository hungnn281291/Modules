
data "azuread_client_config" "current" {}

locals {
  network_acl_enabled = var.bypass != null && var.default_action != null
  network_acl_for_each = (
    local.network_acl_enabled == true
    ? toset(["default"])
    : toset([])
  )
}

resource "azurerm_key_vault" "this" {
  name                            = var.azurerm_key_vault_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  tenant_id                       = var.tenant_id
  soft_delete_retention_days      = 90
  purge_protection_enabled        = var.purge_protection_enabled
  tags                            = merge(local.tags, var.tags)
  sku_name                        = var.sku_name
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enabled_for_deployment          = var.enabled_for_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization

  dynamic "network_acls" {
    for_each = local.network_acl_for_each
    content {
      default_action             = var.default_action
      bypass                     = var.bypass
      ip_rules                   = var.ip_rules
      virtual_network_subnet_ids = var.virtual_network_subnet_ids
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

locals {
  sub_id            = split("/", azurerm_key_vault.this.id)[2]
  kv_admin_role_id  = "00482a5a-887f-4fb3-b363-3b7fe8e74483" # "Key Vault Administrator" 
  key_vault_role_id = format("/subscriptions/%s/providers/Microsoft.Authorization/roleDefinitions/%s", local.sub_id, local.kv_admin_role_id)
}

resource "azurerm_role_assignment" "this" {
  scope              = azurerm_key_vault.this.id
  role_definition_id = local.key_vault_role_id
  principal_id       = data.azuread_client_config.current.object_id
}
