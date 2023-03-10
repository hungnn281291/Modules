### These values have to be build in local block as using data block cause terraform to process plan differently "replace" resources
locals {
  kv_crypto_user_role_id = "12338af0-0e69-4776-bea7-57ae8d297424" # "Key Vault Crypto User"
  sub_id = split("/", var.user_assigned_identity_id)[2]

  key_vault_role_id = format("/subscriptions/%s/providers/Microsoft.Authorization/roleDefinitions/%s", local.sub_id, local.kv_crypto_user_role_id)
}

resource "azurerm_role_assignment" "this" {
  scope              = var.key_vault_id
  role_definition_id = local.key_vault_role_id
  principal_id       = var.user_assigned_identity_principal_id
}

resource "azurerm_automation_account" "this" {
  name                          = var.azurerm_automation_account_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku_name                      = var.sku_name
  local_authentication_enabled  = false # AAA_IAM_006
  public_network_access_enabled = false
  tags                          = merge(local.tags, var.tags)
  depends_on = [
    azurerm_role_assignment.this
  ]

  identity {
    type         = "UserAssigned" # AAA_IAM_001
    identity_ids = [var.user_assigned_identity_id]
  }

  encryption {
    user_assigned_identity_id = var.user_assigned_identity_id
    key_source                = var.key_source
    key_vault_key_id          = var.key_vault_key_id
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
