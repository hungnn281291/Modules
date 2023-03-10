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
| [azurerm_log_analytics_workspace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cmk_for_query_forced"></a> [cmk\_for\_query\_forced](#input\_cmk\_for\_query\_forced) | Is Customer Managed Storage mandatory for query management? | `bool` | `false` | no |
| <a name="input_daily_quota_gb"></a> [daily\_quota\_gb](#input\_daily\_quota\_gb) | The workspace daily quota for ingestion in `GB`. The default value `-1` indicates `unlimited` | `number` | `-1` | no |
| <a name="input_internet_ingestion_enabled"></a> [internet\_ingestion\_enabled](#input\_internet\_ingestion\_enabled) | Should the Log Analytics Workspace support ingestion over the Public Internet? Defaults to true | `bool` | `true` | no |
| <a name="input_internet_query_enabled"></a> [internet\_query\_enabled](#input\_internet\_query\_enabled) | Should the Log Analytics Workspace support querying over the Public Internet? Defaults to true. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Log Analytics Workspace. | `string` | n/a | yes |
| <a name="input_reservation_capacity_in_gb_per_day"></a> [reservation\_capacity\_in\_gb\_per\_day](#input\_reservation\_capacity\_in\_gb\_per\_day) | The capacity reservation level in `GB` for this workspace. Must be in increments of `100` between `100` and `5000`. | `number` | `100` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the Log Analytics workspace is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730. | `number` | `30` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new SKU as of 2018-04-03). Defaults to PerGB2018. | `string` | `"PerGB2018"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Log Analytics Workspace ID. |
| <a name="output_name"></a> [name](#output\_name) | The name of the created Log Analytics Workspace |
| <a name="output_primary_shared_key"></a> [primary\_shared\_key](#output\_primary\_shared\_key) | The Primary shared key for the Log Analytics Workspace. |
| <a name="output_secondary_shared_key"></a> [secondary\_shared\_key](#output\_secondary\_shared\_key) | The Secondary shared key for the Log Analytics Workspace |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | The Workspace (or Customer) ID for the Log Analytics Workspace. |
<!-- END_TF_DOCS -->
