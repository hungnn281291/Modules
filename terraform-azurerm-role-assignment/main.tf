locals {
  principals = toset(var.principal_id)
}

resource "azurerm_role_assignment" "this" {
  for_each = local.principals

  scope              = var.scope
  role_definition_id = var.role_definition_id
  principal_id       = each.key
  # Optional
  name                                   = var.name
  description                            = var.description
  skip_service_principal_aad_check       = var.skip_service_principal_aad_check
  delegated_managed_identity_resource_id = var.delegated_managed_identity_resource_id
  condition                              = var.condition
  condition_version                      = var.condition_version
}

