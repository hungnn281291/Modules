variable "azurerm_automation_account_name" {
  type        = string
  description = "Specifies the name of the Automation Account. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the Automation Account is created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "sku_name" {
  type        = string
  description = "The SKU of the account. The possible values are 'Basic' and 'Free'."
  default     = "Basic"
  validation {
    condition     = contains(["Basic", "Free"], var.sku_name)
    error_message = "Valid values for sku_name are 'Basic' or 'Free'."
  }
}

variable "key_source" {
  type        = string
  description = "The source of the encryption key. Possible values are Microsoft.Automation and Microsoft.Keyvault."
  default     = "Microsoft.Keyvault"
  validation {
    condition     = contains(["Microsoft.Automation", "Microsoft.Keyvault"], var.key_source)
    error_message = "Valid values for key_source are 'Microsoft.Automation', 'Microsoft.Keyvault'"
  }
}

variable "key_vault_id" {
  type        = string
  description = "The ID of key vault"
}

variable "key_vault_key_id" {
  type        = string
  description = "The ID of the Key Vault Key which should be used to Encrypt the data in this Automation Account."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to Azure automation account."
  default     = null
}

variable "user_assigned_identity_id" {
  type        = string
  description = "User Assigned Identity Resource ID to assign to SQL Server"
}

variable "user_assigned_identity_principal_id" {
  type        = string
  description = "User Assigned Identity Principal ID to assign to SQL Server"
}