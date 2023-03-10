<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.25 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.25 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |
| [azurerm_mssql_database_extended_auditing_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database_extended_auditing_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_blob_endpoint"></a> [blob\_endpoint](#input\_blob\_endpoint) | Storage Account blob endpoint for storing audit logs | `string` | n/a | yes |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | Specifies the license type applied to this database. Possible values are 'LicenseIncluded' or 'BasePrice'. | `string` | `"LicenseIncluded"` | no |
| <a name="input_max_size_gb"></a> [max\_size\_gb](#input\_max\_size\_gb) | The max size of the database in gigabytes. | `number` | `4` | no |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | Minimal capacity that database will always have allocated, if not paused. This property is only settable for General Purpose Serverless databases. | `number` | `0.5` | no |
| <a name="input_mssql_database_name"></a> [mssql\_database\_name](#input\_mssql\_database\_name) | The name of the MS SQL Database. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_mssql_server_id"></a> [mssql\_server\_id](#input\_mssql\_server\_id) | The name of the MS SQL Database. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the name of the SKU used by the database. | `string` | `"GP_S_Gen5_2"` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | Storage Account Resource ID for storing audit logs | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags of the MS SQL Server. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Microsoft SQL Database ID. |
| <a name="output_name"></a> [name](#output\_name) | The Microsoft SQL Database Name. |
<!-- END_TF_DOCS -->