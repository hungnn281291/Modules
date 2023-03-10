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
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_condition"></a> [condition](#input\_condition) | Provide the condition that limits the resources that the role can be assigned to. | `string` | `null` | no |
| <a name="input_condition_version"></a> [condition\_version](#input\_condition\_version) | The version of the condition. Possible values are `1.0` or `2.0`. | `string` | `null` | no |
| <a name="input_delegated_managed_identity_resource_id"></a> [delegated\_managed\_identity\_resource\_id](#input\_delegated\_managed\_identity\_resource\_id) | Provide the delegated `Azure Resource Id` which contains a `Managed Identity`. This field is used in cross tenant scenario. The `principal_id` in this scenario must be the `object_id` of the `Managed Identity` | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | A description for this Role Assignment. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | A unique UUID/GUID for this Role Assignment - one will be generated if not specified. | `string` | `null` | no |
| <a name="input_principal_id"></a> [principal\_id](#input\_principal\_id) | The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created. | `list(string)` | n/a | yes |
| <a name="input_role_definition_id"></a> [role\_definition\_id](#input\_role\_definition\_id) | The Scoped-ID of the Role Definition. Changing this forces a new resource to be created. Conflicts with role\_definition\_name. | `string` | n/a | yes |
| <a name="input_scope"></a> [scope](#input\_scope) | The scope at which the Role Assignment applies to, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM, or /providers/Microsoft.Management/managementGroups/myMG. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_skip_service_principal_aad_check"></a> [skip\_service\_principal\_aad\_check](#input\_skip\_service\_principal\_aad\_check) | If the `principal_id` is a newly provisioned `Service Principal` set this value to `true` to skip the `Azure Active Directory` check: it may fail due to replication lag. This argument is only valid if the `principal_id` is of type `Service Principal`. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_assignments"></a> [role\_assignments](#output\_role\_assignments) | Full Role Assignment(s) details. |
<!-- END_TF_DOCS -->