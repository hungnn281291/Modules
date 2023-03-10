locals {
  expiration_date = (
    var.expiration_date == null
    ? timeadd("${formatdate("YYYY-MM-DD", timestamp())}T00:00:00Z", "8760h")
    : var.expiration_date
  )
}

resource "azurerm_key_vault_secret" "this" {
  name            = var.name
  value           = var.value
  key_vault_id    = var.key_vault_id
  content_type    = var.content_type
  expiration_date = local.expiration_date
  tags            = merge(local.tags, var.tags)

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
