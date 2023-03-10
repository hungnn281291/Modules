<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_key.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.25.0/docs/resources/key_vault_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_expiration_date"></a> [expiration\_date](#input\_expiration\_date) | Expiration UTC datetime (Y-m-d'T'H:M:S'Z'). | `string` | `null` | no |
| <a name="input_key_opts"></a> [key\_opts](#input\_key\_opts) | A list of JSON web key operations. Possible values include: decrypt, encrypt, sign, unwrapKey, verify and wrapKey. Please note these values are case sensitive. | `list(string)` | n/a | yes |
| <a name="input_key_size"></a> [key\_size](#input\_key\_size) | Specifies the Size of the RSA key to create in bytes. For example, 1024 or 2048. Note: This field is required if key\_type is RSA or RSA-HSM. Changing this forces a new resource to be created. | `number` | `2048` | no |
| <a name="input_key_type"></a> [key\_type](#input\_key\_type) | Specifies the Key Type to use for this Key Vault Key. Possible values are EC (Elliptic Curve), EC-HSM, RSA and RSA-HSM. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the Key Vault where the Key should be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Key Vault Key. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Key Vault Key ID. |
<!-- END_TF_DOCS -->
