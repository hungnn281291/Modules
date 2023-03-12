Modules
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.1 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~>2.30 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.25 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | n/a | `string` | `"__business_unit__"` | no |
| <a name="input_contact_email"></a> [contact\_email](#input\_contact\_email) | n/a | `string` | `"__contact_email__"` | no |
| <a name="input_contact_name"></a> [contact\_name](#input\_contact\_name) | n/a | `string` | `"__contact_name__"` | no |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | n/a | `string` | `"__cost_center__"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_environment_map"></a> [environment\_map](#input\_environment\_map) | n/a | `map(any)` | <pre>{<br>  "development": "dv",<br>  "development_integration": "di",<br>  "non_production": "np",<br>  "performance_testing": "pt",<br>  "production": "pd",<br>  "quality_assurance": "qa",<br>  "sandbox": "sb",<br>  "user_acceptance_testing": "ut"<br>}</pre> | no |
| <a name="input_generator"></a> [generator](#input\_generator) | n/a | `map(map(number))` | <pre>{<br>  "app": {<br>    "rg": 1<br>  }<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | general | `string` | n/a | yes |
| <a name="input_location_map"></a> [location\_map](#input\_location\_map) | n/a | `map(any)` | <pre>{<br>  "australiacentral": "ac",<br>  "australiacentral2": "ac2",<br>  "australiaeast": "ae",<br>  "australiasoutheast": "ase",<br>  "brazilsouth": "brs",<br>  "canadacentral": "cac",<br>  "canadaeast": "cae",<br>  "centralindia": "ic",<br>  "centralus": "uc",<br>  "chinaeast": "ce",<br>  "chinaeast2": "ce2",<br>  "chinanorth": "cn",<br>  "chinanorth2": "cn2",<br>  "eastasia": "ae",<br>  "eastus": "ue",<br>  "eastus2": "ue2",<br>  "francecentral": "fc",<br>  "francesouth": "fs",<br>  "germanycentral": "gc",<br>  "germanynorth": "gn",<br>  "germanynortheast": "gne",<br>  "germanywestcentral": "gwc",<br>  "global": "gl",<br>  "japaneast": "je",<br>  "japanwest": "jw",<br>  "koreacentral": "kc",<br>  "koreasouth": "ks",<br>  "northcentralus": "unc",<br>  "northeurope": "en",<br>  "norwayeast": "ne",<br>  "norwaywest": "nw",<br>  "notapplicable": "",<br>  "southafricanorth": "san",<br>  "southafricawest": "saw",<br>  "southcentralus": "usc",<br>  "southeastasia": "ase",<br>  "southindia": "is",<br>  "switzerlandnorth": "swn",<br>  "switzerlandwest": "sww",<br>  "uaecentral": "uac",<br>  "uaenorth": "uan",<br>  "uksouth": "uks",<br>  "ukwest": "ukw",<br>  "usdodcentral": "ucd",<br>  "usdodeast": "ued",<br>  "usgovarizona": "uag",<br>  "usgoviowa": "uig",<br>  "usgovtexas": "utg",<br>  "usgovvirginia": "uvg",<br>  "westcentralus": "us",<br>  "westeurope": "ew",<br>  "westindia": "iw",<br>  "westus": "uw",<br>  "westus2": "us",<br>  "worldwide": "ww-"<br>}</pre> | no |
| <a name="input_managed_by_vendor"></a> [managed\_by\_vendor](#input\_managed\_by\_vendor) | n/a | `string` | `"__managed_by_vendor__"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | tags | `string` | `"__owner__"` | no |
| <a name="input_product_area"></a> [product\_area](#input\_product\_area) | n/a | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | `"__project_name__"` | no |
| <a name="input_requestor"></a> [requestor](#input\_requestor) | n/a | `string` | `"__requestor__"` | no |
| <a name="input_service_class"></a> [service\_class](#input\_service\_class) | n/a | `string` | `"__service_class__"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_env_abbr"></a> [env\_abbr](#output\_env\_abbr) | Abbreviated environment name. |
| <a name="output_environment"></a> [environment](#output\_environment) | Environment name. |
| <a name="output_generated_names"></a> [generated\_names](#output\_generated\_names) | Generated names. |
| <a name="output_location"></a> [location](#output\_location) | Location |
| <a name="output_prefix"></a> [prefix](#output\_prefix) | Prefix name. |
| <a name="output_tags"></a> [tags](#output\_tags) | tags. |
<!-- END_TF_DOCS -->
