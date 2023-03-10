variable "name" {
  type        = string
  description = "Specifies the name of the Log Analytics Workspace."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the Log Analytics workspace is created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "sku" {
  type        = string
  description = "Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new SKU as of 2018-04-03). Defaults to PerGB2018."
  default     = "PerGB2018"
}

variable "retention_in_days" {
  type        = number
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  default     = 30
}

variable "internet_ingestion_enabled" {
  type        = bool
  description = "Should the Log Analytics Workspace support ingestion over the Public Internet? Defaults to true"
  default     = true
}

variable "internet_query_enabled" {
  type        = bool
  description = "Should the Log Analytics Workspace support querying over the Public Internet? Defaults to true."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = null
}

variable "daily_quota_gb" {
  type        = number
  description = "The workspace daily quota for ingestion in `GB`. The default value `-1` indicates `unlimited`"
  default     = -1
}

variable "reservation_capacity_in_gb_per_day" {
  type        = number
  description = "The capacity reservation level in `GB` for this workspace. Must be in increments of `100` between `100` and `5000`."
  default     = 100
}

variable "cmk_for_query_forced" {
  type        = bool
  description = "Is Customer Managed Storage mandatory for query management?"
  default     = false
}
