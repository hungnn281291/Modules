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
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_network_interface_name"></a> [custom\_network\_interface\_name](#input\_custom\_network\_interface\_name) | The custom name of the network interface attached to the private endpoint. | `string` | n/a | yes |
| <a name="input_ipconfiguration_name"></a> [ipconfiguration\_name](#input\_ipconfiguration\_name) | Specifies the Name of the IP Configuration. | `string` | `null` | no |
| <a name="input_is_manual_connection"></a> [is\_manual\_connection](#input\_is\_manual\_connection) | Does the Private Endpoint require Manual Approval from the remote resource owner | `string` | `"false"` | no |
| <a name="input_location"></a> [location](#input\_location) | The supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_member_name"></a> [member\_name](#input\_member\_name) | Specifies the member name this IP address applies to. | `string` | `"default"` | no |
| <a name="input_private_connection_resource_id"></a> [private\_connection\_resource\_id](#input\_private\_connection\_resource\_id) | The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. | `string` | n/a | yes |
| <a name="input_private_dns_zone_group_name"></a> [private\_dns\_zone\_group\_name](#input\_private\_dns\_zone\_group\_name) | Specifies the Name of the Private DNS Zone Group. | `string` | n/a | yes |
| <a name="input_private_dns_zone_ids"></a> [private\_dns\_zone\_ids](#input\_private\_dns\_zone\_ids) | Specifies the list of Private DNS Zones to include within the private\_dns\_zone\_group. | `list(string)` | n/a | yes |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | Specifies the static IP address within the private endpoint's subnet to be used. | `string` | `null` | no |
| <a name="input_privateendpoint_name"></a> [privateendpoint\_name](#input\_privateendpoint\_name) | Specifies the Name of the Private Endpoint. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the Name of the Resource Group within which the Private Endpoint should exist. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. | `string` | n/a | yes |
| <a name="input_subresource_name"></a> [subresource\_name](#input\_subresource\_name) | Specifies the subresource this IP address applies to. | `string` | `null` | no |
| <a name="input_subresource_names"></a> [subresource\_names](#input\_subresource\_names) | A list of subresource names which the Private Endpoint is able to connect to. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_dns_configs"></a> [custom\_dns\_configs](#output\_custom\_dns\_configs) | The fully qualified domain name and list of all IP Addresses that map to the private\_endpoint fqdn. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Private Endpoint. |
| <a name="output_ip_configuration"></a> [ip\_configuration](#output\_ip\_configuration) | Name,static IP address set by this configuration of the IP Configuration.The subresource this IP address applies to, which corresponds to the group\_id. |
| <a name="output_name"></a> [name](#output\_name) | The Name of the Private Endpoint. |
| <a name="output_network_interface"></a> [network\_interface](#output\_network\_interface) | The ID and Name of the network interface associated with the private\_endpoint. |
| <a name="output_private_dns_zone_configs"></a> [private\_dns\_zone\_configs](#output\_private\_dns\_zone\_configs) | The Name , ID , list of IP Addresses of the Private DNS Zone config |
| <a name="output_private_dns_zone_group"></a> [private\_dns\_zone\_group](#output\_private\_dns\_zone\_group) | The ID of the Private DNS Zone Group. |
| <a name="output_private_service_connection"></a> [private\_service\_connection](#output\_private\_service\_connection) | The private IP address associated with the private endpoint |
<!-- END_TF_DOCS -->
