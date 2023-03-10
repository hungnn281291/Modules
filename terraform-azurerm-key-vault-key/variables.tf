variable "name" {
  type        = string
  description = "Specifies the name of the Key Vault Key. Changing this forces a new resource to be created."
}

variable "key_vault_id" {
  type        = string
  description = "The ID of the Key Vault where the Key should be created. Changing this forces a new resource to be created."
}

variable "key_type" {
  type        = string
  description = "Specifies the Key Type to use for this Key Vault Key. Possible values are EC (Elliptic Curve), EC-HSM, RSA and RSA-HSM. Changing this forces a new resource to be created."
  validation {
    condition     = contains(["EC (Elliptic Curve)", "EC-HSM", "RSA","RSA-HSM"], var.key_type)
    error_message = "Value of key type must be one of: [EC (Elliptic Curve), EC-HSM, RSA and RSA-HSM]."
  }
}

variable "key_size" {
  type        = number
  description = "Specifies the Size of the RSA key to create in bytes. For example, 1024 or 2048. Note: This field is required if key_type is RSA or RSA-HSM. Changing this forces a new resource to be created."
  default     = 2048
}

variable "key_opts" {
  type        = list(string)
  description = "A list of JSON web key operations. Possible values include: decrypt, encrypt, sign, unwrapKey, verify and wrapKey. Please note these values are case sensitive."
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
