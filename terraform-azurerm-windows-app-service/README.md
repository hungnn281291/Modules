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
| [azurerm_service_plan.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_windows_web_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_login_parameters"></a> [additional\_login\_parameters](#input\_additional\_login\_parameters) | Specifies a map of login Parameters to send to the OpenID Connect authorization endpoint when a user logs in. | `any` | `null` | no |
| <a name="input_allowed_external_redirect_urls"></a> [allowed\_external\_redirect\_urls](#input\_allowed\_external\_redirect\_urls) | Specifies a list of External URLs that can be redirected to as part of logging in or logging out of the Windows Web App. | `any` | `null` | no |
| <a name="input_allowed_origins"></a> [allowed\_origins](#input\_allowed\_origins) | Specifies a list of origins that should be allowed to make cross-origin calls.Only needed when cors\_rule\_enabled is `true` | `list(string)` | n/a | yes |
| <a name="input_always_on"></a> [always\_on](#input\_always\_on) | If this Windows Web App is Always On enabled. Defaults to true. | `bool` | `true` | no |
| <a name="input_api_management_api_id"></a> [api\_management\_api\_id](#input\_api\_management\_api\_id) | The API Management API ID this Windows Web App Slot is associated with. | `any` | `null` | no |
| <a name="input_app_command_line"></a> [app\_command\_line](#input\_app\_command\_line) | The App command line to launch. | `any` | `null` | no |
| <a name="input_app_ip_restriction_ip_address"></a> [app\_ip\_restriction\_ip\_address](#input\_app\_ip\_restriction\_ip\_address) | The CIDR notation of the IP or IP Range to match. For example: 192.0.0.0/24 or 192.168.10.10/32.One and only one of app\_ip\_restriction\_ip\_address, app\_ip\_restriction\_service\_tag or app\_ip\_restriction\_virtual\_network\_subnet\_id must be specified. | `string` | `""` | no |
| <a name="input_app_ip_restriction_service_tag"></a> [app\_ip\_restriction\_service\_tag](#input\_app\_ip\_restriction\_service\_tag) | The Service Tag used for app IP Restriction.One and only one of app\_ip\_restriction\_ip\_address, app\_ip\_restriction\_service\_tag or app\_ip\_restriction\_virtual\_network\_subnet\_id must be specified. | `string` | `""` | no |
| <a name="input_app_ip_restriction_virtual_network_subnet_id"></a> [app\_ip\_restriction\_virtual\_network\_subnet\_id](#input\_app\_ip\_restriction\_virtual\_network\_subnet\_id) | The Virtual Network Subnet ID used for app IP Restriction.One and only one of app\_ip\_restriction\_ip\_address, app\_ip\_restriction\_service\_tag or app\_ip\_restriction\_virtual\_network\_subnet\_id must be specified. | `string` | n/a | yes |
| <a name="input_app_service_environment_id"></a> [app\_service\_environment\_id](#input\_app\_service\_environment\_id) | The ID of the App Service Environment to create this Service Plan in. | `any` | `null` | no |
| <a name="input_app_service_name"></a> [app\_service\_name](#input\_app\_service\_name) | The name which should be used for this Windows Web App. Changing this forces a new Windows Web App to be created. | `string` | n/a | yes |
| <a name="input_app_service_plan_name"></a> [app\_service\_plan\_name](#input\_app\_service\_plan\_name) | Specifies the name of the App Service Plan component. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | A map of key-value pairs of App Settings. | `any` | `null` | no |
| <a name="input_client_affinity_enabled"></a> [client\_affinity\_enabled](#input\_client\_affinity\_enabled) | Should Client Affinity be enabled? | `bool` | `false` | no |
| <a name="input_client_certificate_mode"></a> [client\_certificate\_mode](#input\_client\_certificate\_mode) | The Client Certificate mode | `string` | `"Optional"` | no |
| <a name="input_cors_rule_enabled"></a> [cors\_rule\_enabled](#input\_cors\_rule\_enabled) | Is cors rule enabled? | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Should the Authentication / Authorization feature is enabled for the Windows Web App be enabled? | `bool` | `true` | no |
| <a name="input_ftps_state"></a> [ftps\_state](#input\_ftps\_state) | The State of FTP / FTPS service. Possible values include: AllAllowed, FtpsOnly, Disabled. | `string` | `"Disabled"` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | The path to the Health Check. | `string` | `null` | no |
| <a name="input_http2_enabled"></a> [http2\_enabled](#input\_http2\_enabled) | Should the HTTP2 be enabled? | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_maximum_elastic_worker_count"></a> [maximum\_elastic\_worker\_count](#input\_maximum\_elastic\_worker\_count) | The maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan. | `number` | `null` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer. Changing this forces a new resource to be created | `string` | n/a | yes |
| <a name="input_per_site_scaling_enabled"></a> [per\_site\_scaling\_enabled](#input\_per\_site\_scaling\_enabled) | Should Per Site Scaling be enabled. Defaults to false. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the App Service. | `string` | n/a | yes |
| <a name="input_runtime_version"></a> [runtime\_version](#input\_runtime\_version) | The RuntimeVersion of the Authentication / Authorization feature in use for the Windows Web App. | `any` | `null` | no |
| <a name="input_scm_ip_restriction_virtual_network_subnet_id"></a> [scm\_ip\_restriction\_virtual\_network\_subnet\_id](#input\_scm\_ip\_restriction\_virtual\_network\_subnet\_id) | The Virtual Network Subnet ID used for scm IP Restriction. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU for the plan. Possible values include P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3 | `string` | n/a | yes |
| <a name="input_support_credentials"></a> [support\_credentials](#input\_support\_credentials) | Whether CORS requests with credentials are allowed.Only needed when cors\_rule\_enabled is `true` | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(any)` | `null` | no |
| <a name="input_token_refresh_extension_hours"></a> [token\_refresh\_extension\_hours](#input\_token\_refresh\_extension\_hours) | The number of hours after session token expiration that a session token can be used to call the token refresh API. Defaults to 72 hours. | `number` | `72` | no |
| <a name="input_token_store_enabled"></a> [token\_store\_enabled](#input\_token\_store\_enabled) | Should the Windows Web App durably store platform-specific security tokens that are obtained during login flows? Defaults to false. | `bool` | `false` | no |
| <a name="input_use_32_bit_worker"></a> [use\_32\_bit\_worker](#input\_use\_32\_bit\_worker) | Should the Windows Web App use a 32-bit worker. Defaults to true. | `bool` | `true` | no |
| <a name="input_virtual_network_subnet_id"></a> [virtual\_network\_subnet\_id](#input\_virtual\_network\_subnet\_id) | The subnet id which will be used by this Web App for regional virtual network integration. | `string` | n/a | yes |
| <a name="input_websockets_enabled"></a> [websockets\_enabled](#input\_websockets\_enabled) | Should Web Sockets be enabled. Defaults to false | `bool` | `false` | no |
| <a name="input_worker_count"></a> [worker\_count](#input\_worker\_count) | The number of Workers (instances) to be allocated. | `number` | `2` | no |
| <a name="input_zone_balancing_enabled"></a> [zone\_balancing\_enabled](#input\_zone\_balancing\_enabled) | Should the Service Plan balance across Availability Zones in the region. Changing this forces a new resource to be created. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Plan_id"></a> [Plan\_id](#output\_Plan\_id) | The ID of the Service Plan. |
| <a name="output_Plan_kind"></a> [Plan\_kind](#output\_Plan\_kind) | A string representing the Kind of Service Plan. |
| <a name="output_app_service_id"></a> [app\_service\_id](#output\_app\_service\_id) | The ID of the Windows Web App. |
| <a name="output_app_service_kind"></a> [app\_service\_kind](#output\_app\_service\_kind) | The Kind value for this Windows Web App. |
| <a name="output_app_service_principal_id"></a> [app\_service\_principal\_id](#output\_app\_service\_principal\_id) | The Principal ID associated with this Managed Service Identity. |
| <a name="output_custom_domain_verification_id"></a> [custom\_domain\_verification\_id](#output\_custom\_domain\_verification\_id) | The identifier used by App Service to perform domain ownership verification via DNS TXT record. |
| <a name="output_default_hostname"></a> [default\_hostname](#output\_default\_hostname) | The default hostname of the Windows Web App. |
| <a name="output_outbound_ip_address_list"></a> [outbound\_ip\_address\_list](#output\_outbound\_ip\_address\_list) | A list of outbound IP addresses - such as 52.23.25.3, 52.143.43.12 |
| <a name="output_outbound_ip_addresses"></a> [outbound\_ip\_addresses](#output\_outbound\_ip\_addresses) | A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12. |
<!-- END_TF_DOCS -->