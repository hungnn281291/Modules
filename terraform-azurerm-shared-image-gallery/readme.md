Modules
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
| [azurerm_shared_image_gallery.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.25.0/docs/resources/shared_image_gallery) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description of Shared Image Gallery. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The region were the resource will be deployed. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Shared Image Gallery. | `string` | n/a | yes |
| <a name="input_shared_image_gallery_name"></a> [shared\_image\_gallery\_name](#input\_shared\_image\_gallery\_name) | The name of the Shared Image Gallery. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags of the Shared Image Gallery. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the created shared image gallery. |
| <a name="output_unique_name"></a> [unique\_name](#output\_unique\_name) | The unique name of the created shared image gallery. |
<!-- END_TF_DOCS -->
