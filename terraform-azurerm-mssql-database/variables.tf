variable "mssql_server_id" {
  type        = string
  description = "The name of the MS SQL Database. Changing this forces a new resource to be created."
}

variable "mssql_database_name" {
  type        = string
  description = "The name of the MS SQL Database. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = map(string)
  description = "Tags of the MS SQL Server."
  default     = null
}

variable "license_type" {
  type        = string
  description = "Specifies the license type applied to this database. Possible values are 'LicenseIncluded' or 'BasePrice'."
  default     = "LicenseIncluded"
  validation {
    condition     = contains(["LicenseIncluded", "BasePrice"], var.license_type)
    error_message = "Valid values for license_type are 'LicenseIncluded' or 'BasePrice'."
  }
}

variable "sku_name" {
  type        = string
  description = "Specifies the name of the SKU used by the database."
  default     = "GP_S_Gen5_2"
}

variable "min_capacity" {
  type        = number
  description = "Minimal capacity that database will always have allocated, if not paused. This property is only settable for General Purpose Serverless databases."
  default     = 0.5
}

variable "max_size_gb" {
  type        = number
  description = "The max size of the database in gigabytes."
  default     = 4
}

variable "storage_account_id" {
  type        = string
  description = "Storage Account Resource ID for storing audit logs"
}

variable "blob_endpoint" {
  type        = string
  description = "Storage Account blob endpoint for storing audit logs"
}