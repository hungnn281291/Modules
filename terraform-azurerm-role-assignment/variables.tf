variable "scope" {
  type        = string
  description = "The scope at which the Role Assignment applies to, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM, or /providers/Microsoft.Management/managementGroups/myMG. Changing this forces a new resource to be created."
}

variable "role_definition_id" {
  type        = string
  description = "The Scoped-ID of the Role Definition. Changing this forces a new resource to be created. Conflicts with role_definition_name."
}

variable "principal_id" {
  type        = list(string)
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created."
}

variable "name" {
  type        = string
  description = "A unique UUID/GUID for this Role Assignment - one will be generated if not specified."
  default     = null
}

variable "description" {
  type        = string
  description = "A description for this Role Assignment."
  default     = null
}

variable "skip_service_principal_aad_check" {
  type        = bool
  description = "If the `principal_id` is a newly provisioned `Service Principal` set this value to `true` to skip the `Azure Active Directory` check: it may fail due to replication lag. This argument is only valid if the `principal_id` is of type `Service Principal`."
  default     = false
}

variable "delegated_managed_identity_resource_id" {
  type        = string
  description = "Provide the delegated `Azure Resource Id` which contains a `Managed Identity`. This field is used in cross tenant scenario. The `principal_id` in this scenario must be the `object_id` of the `Managed Identity`"
  default     = null
}

variable "condition" {
  type        = string
  description = "Provide the condition that limits the resources that the role can be assigned to."
  default     = null
}

variable "condition_version" {
  type        = string
  description = "The version of the condition. Possible values are `1.0` or `2.0`."
  default     = null
}
