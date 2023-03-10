variable "name" {
  type        = string
  description = "Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created."
}

variable "value" {
  type        = string
  description = "Specifies the value of the Key Vault Secret."
}

variable "key_vault_id" {
  type        = string
  description = "The ID of the Key Vault where the Secret should be created."
}

variable "content_type" {
  type        = string
  description = "Specifies the content type for the Key Vault Secret."
  default     = "sensitive"
}

variable "expiration_date" {
  type        = string
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = null
}
