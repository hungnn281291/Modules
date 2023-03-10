locals {
  expiration_date = (
    var.expiration_date == null
    ? timeadd("${formatdate("YYYY-MM-DD", timestamp())}T00:00:00Z", "8760h")
    : var.expiration_date
  )
}

resource "azurerm_key_vault_key" "this" {
  name            = var.name
  key_vault_id    = var.key_vault_id
  key_type        = var.key_type
  key_size        = var.key_size
  tags            = merge(local.tags, var.tags)
  expiration_date = local.expiration_date
  key_opts        = var.key_opts

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
