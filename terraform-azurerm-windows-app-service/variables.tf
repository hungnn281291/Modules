variable "app_service_plan_name" {
  type        = string
  description = "Specifies the name of the App Service Plan component. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the App Service."
}

variable "os_type" {
  type        = string
  description = "The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer. Changing this forces a new resource to be created"
  validation {
    condition     = contains(["Windows", "WindowsContainer"], var.os_type)
    error_message = "Value of App service must be one of: [Windows,WindowsContainer]."
  }
}

variable "maximum_elastic_worker_count" {
  type        = number
  description = "The maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan."
  default     = null
}

variable "app_service_environment_id" {
  type        = any
  description = "The ID of the App Service Environment to create this Service Plan in."
  default     = null
}

# AAS_TDS_001 Only use the Standard/Premium App Service plans
variable "sku_name" {
  type        = string
  description = "The SKU for the plan. Possible values include P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3"
  validation {
    condition     = contains(["P1v2", "P2v2", "P3v3", "S1", "S2", "S3"], var.sku_name)
    error_message = "Value of App service must be one of: [P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3]."
  }
}

variable "per_site_scaling_enabled" {
  type        = bool
  description = "Should Per Site Scaling be enabled. Defaults to false."
  default     = false
}

variable "worker_count" {
  type        = number
  description = "The number of Workers (instances) to be allocated."
  default     = 2
}

variable "use_32_bit_worker" {
  type        = bool
  description = "Should the Windows Web App use a 32-bit worker. Defaults to true."
  default     = true
}

variable "zone_balancing_enabled" {
  type        = bool
  description = "Should the Service Plan balance across Availability Zones in the region. Changing this forces a new resource to be created."
  default     = false
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the resource."
  default     = null
}

variable "app_service_name" {
  type        = string
  description = "The name which should be used for this Windows Web App. Changing this forces a new Windows Web App to be created."
}

variable "client_affinity_enabled" {
  type        = bool
  description = "Should Client Affinity be enabled?"
  default     = false
}

variable "client_certificate_mode" {
  type        = string
  description = "The Client Certificate mode"
  validation {
    condition     = contains(["Required", "Optional", "OptionalInteractiveUser"], var.client_certificate_mode)
    error_message = "Value of client_certificate_mode must be one of: [Required,Optional,OptionalInteractiveUser]."
  }
  default = "Optional" # AAS_IAM_004
}

variable "always_on" {
  type        = bool
  description = "If this Windows Web App is Always On enabled. Defaults to true."
  default     = true
}

variable "api_management_api_id" {
  type        = any
  description = "The API Management API ID this Windows Web App Slot is associated with."
  default     = null
}

variable "app_command_line" {
  type        = any
  description = "The App command line to launch."
  default     = null
}

variable "ftps_state" {
  type        = string
  description = "The State of FTP / FTPS service. Possible values include: AllAllowed, FtpsOnly, Disabled."
  validation {
    condition     = contains(["FtpsOnly", "Disabled"], var.ftps_state)
    error_message = "Value of state must be one of: [FtpsOnly,Disabled]."
  }
  default = "Disabled" #AAS_IAM_008
}

variable "http2_enabled" {
  type        = bool
  description = "Should the HTTP2 be enabled?"
  default     = true
}

variable "websockets_enabled" {
  type        = bool
  description = "Should Web Sockets be enabled. Defaults to false"
  default     = false #AAS_TDS_009
}

variable "health_check_path" {
  type        = string
  description = "The path to the Health Check."
  default     = null
}

variable "enabled" {
  type        = bool
  description = "Should the Authentication / Authorization feature is enabled for the Windows Web App be enabled?"
  default     = true
}

variable "additional_login_parameters" {
  type        = any
  description = " Specifies a map of login Parameters to send to the OpenID Connect authorization endpoint when a user logs in."
  default     = null
}

variable "allowed_external_redirect_urls" {
  type        = any
  description = "Specifies a list of External URLs that can be redirected to as part of logging in or logging out of the Windows Web App."
  default     = null
}

variable "runtime_version" {
  type        = any
  description = "The RuntimeVersion of the Authentication / Authorization feature in use for the Windows Web App."
  default     = null
}

variable "token_refresh_extension_hours" {
  type        = number
  description = "The number of hours after session token expiration that a session token can be used to call the token refresh API. Defaults to 72 hours."
  default     = 72
}

variable "token_store_enabled" {
  type        = bool
  description = "Should the Windows Web App durably store platform-specific security tokens that are obtained during login flows? Defaults to false."
  default     = false
}

variable "app_settings" {
  type        = any
  description = "A map of key-value pairs of App Settings."
  default     = null
}

variable "cors_rule_enabled" {
  type        = bool
  description = "Is cors rule enabled?"
  default     = false
}

variable "allowed_origins" {
  type = list(string)
  # validation {
  #   condition     = contains(["*"], var.allowed_origins)
  #   error_message = "Value of allowed_origins should not be *."
  # }
  description = "Specifies a list of origins that should be allowed to make cross-origin calls.Only needed when cors_rule_enabled is `true`"
  # default = []
}

variable "support_credentials" {
  type        = bool
  description = "Whether CORS requests with credentials are allowed.Only needed when cors_rule_enabled is `true`"
  default     = false
}

variable "app_ip_restriction_ip_address" {
  type        = string
  description = "The CIDR notation of the IP or IP Range to match. For example: 192.0.0.0/24 or 192.168.10.10/32.One and only one of app_ip_restriction_ip_address, app_ip_restriction_service_tag or app_ip_restriction_virtual_network_subnet_id must be specified."
  default     = ""
}

variable "app_ip_restriction_service_tag" {
  type        = string
  description = "The Service Tag used for app IP Restriction.One and only one of app_ip_restriction_ip_address, app_ip_restriction_service_tag or app_ip_restriction_virtual_network_subnet_id must be specified."
  default     = ""
}

variable "app_ip_restriction_virtual_network_subnet_id" {
  type        = string
  description = "The Virtual Network Subnet ID used for app IP Restriction.One and only one of app_ip_restriction_ip_address, app_ip_restriction_service_tag or app_ip_restriction_virtual_network_subnet_id must be specified."
}

variable "scm_ip_restriction_virtual_network_subnet_id" {
  type        = string
  description = "The Virtual Network Subnet ID used for scm IP Restriction."
}

variable "virtual_network_subnet_id" {
  type        = string
  description = "The subnet id which will be used by this Web App for regional virtual network integration."
}
