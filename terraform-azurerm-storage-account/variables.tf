variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "name" {
  description = "Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
  type        = string
}

variable "account_kind" {
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created."
  default     = "StorageV2"
  type        = string
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  default     = "Standard"
  type        = string
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa."
  default     = "LRS"
  type        = string
}

variable "allow_nested_items_to_be_public" {
  description = "Allow or disallow public access to all nested items in the storage account."
  default     = false
  type        = bool
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account. Possible values are 'TLS1_0', 'TLS1_1', and 'TLS1_2'"
  default     = "TLS1_2"
  type        = string
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Storage Account should exist. Changing this forces a new Storage Account to be created."
  default     = null
  type        = string
}

variable "shared_access_key_enabled" {
  description = "Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). Setting this value to 'false' requires setting [storage_use_azuread](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#storage_use_azuread) flag to 'true'. If want to create file share, set this to 'true'."
  default     = false
  type        = bool
}

variable "static_website" {
  description = "A static_website block as defined. It can only be set when the account_kind is set to StorageV2 or BlockBlobStorage."
  default     = null
  type = object({
    index_document     = string
    error_404_document = string
  })
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  default     = null
  type        = map(string)
}

variable "change_feed_enabled" {
  description = "Is the blob service properties for change feed events enabled?"
  default     = true
  type        = bool
}

variable "delete_retention_policy_days" {
  type        = number
  description = "Specifies the number of days that the blob should be retained, between '1' and '365'. Defaults to 7"
  default     = 7
}

variable "file_share_delete_retention_policy_days" {
  type        = number
  description = "Specifies the number of days that the azurerm_storage_share should be retained, between 1 and 365 days. Defaults to 7"
  default     = 7
}
variable "container_delete_retention_policy_days" {
  type        = number
  description = "Specifies the number of days that the container should be retained, between 1 and 365 days. Defaults to 7"
  default     = 7
}

variable "last_access_time_enabled" {
  description = "Is the last access time based tracking enabled?"
  default     = false
  type        = bool
}

variable "versioning_enabled" {
  description = "Is versioning enabled?"
  default     = true
  type        = bool
}

variable "key_vault_id" {
  type        = string
  description = "ID of the existing Key vault to store the Customer Managed Key for Encryption."
}

variable "assign_identity" {
  type        = bool
  description = "Set to `true`, the Storage Account will be assigned an identity."
  default     = true
}

variable "large_file_share_enabled" {
  type        = bool
  description = "Set to `true`, the Storage Account will be enabled for large file shares."
  default     = false
}
variable "nfsv3_enabled" {
  type        = bool
  description = "Set to `true`, the `NFSV3` protocol will be enabled."
  default     = false
}

variable "network_rules" {
  description = "Networking settings for the Storage Account:<br></br><ul><li>`default_action`: The Default Action to use when no rules match ip_rules / virtual_network_subnet_ids. Possible values are `\"Allow\"` and `\"Deny\"`,</li><li>`ip_rules`: One or more <b>Public IP Addresses or CIDR Blocks</b> which should be able to access the Storage Account,</li><li>`virtual_network_subnet_ids`: One or more Subnet IDs which should be able to access the Storage Account.</li></ul>"
  type = object({
    default_action             = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  })
  default = {
    default_action             = "Deny"
    ip_rules                   = []
    virtual_network_subnet_ids = []
  }
}

variable "cmk_enabled" {
  type        = bool
  description = "Set `true` to enable Storage encryption with `Customer-managed key`. Variable `assign_identity` needs to be set `true` to set `cmk_enabled` true. "
  default     = true
}

variable "persist_access_key" {
  type        = bool
  description = "Set `true` to store storage access key in `key vault`."
  default     = true
}

variable "containers" {
  description = "Map of the Containers in the Storage Account.<br></br><ul><li>`name`: The name of the Container which should be created within the Storage Account."
  type = map(object({
    name = string
  }))
  default = {}
}
variable "blobs" {
  description = "Map of the Storage Blobs in the Containers.<br></br><ul><li>`name`: The name of the storage blob. Must be unique within the storage container the blob is located, </li><li>`storage_container_name`: The name of the storage container in which this blob should be created, </li><li>`type`: The type of the storage blob to be created. Possible values are `Append`, `Block` or `Page`, </li><li>`size`: Used only for page blobs to specify the size in bytes of the blob to be created. Must be a multiple of 512, </li><li>`content_type`: The content type of the `storage blob`. Cannot be defined if `source_uri` is defined, </li><li>`parallelism`: The number of workers per CPU core to run for concurrent uploads, </li><li>`source_uri`: The URI of an existing blob, or a file in the Azure File service, to use as the source contents for the blob to be created, </li><li>`metadata`: A map of custom blob metadata."
  type = map(object({
    name                   = string
    storage_container_name = string
    type                   = string
    size                   = number
    content_type           = string
    parallelism            = number
    source_uri             = string
    metadata               = map(any)
  }))
  default = {}
}

variable "queues" {
  description = "Map of the Storage Queues.<br></br><ul><li>`name`: The name of the Queue which should be created within the Storage Account. Must be unique within the storage account the queue is located, </li><li>`metadata`: A mapping of MetaData which should be assigned to this Storage Queue."
  type = map(object({
    name     = string
    metadata = map(any)
  }))
  default = {}
}

variable "file_shares" {
  description = "Map of the Storage File Shares.<br></br><ul><li>`name`: The name of the share. Must be unique within the storage account where the share is located, </li><li>`quota`: The maximum size of the share, in gigabytes. For Standard storage accounts, this must be greater than 0 and less than 5120 GB (5 TB). For Premium FileStorage storage accounts, this must be greater than 100 GB and less than 102400 GB (100 TB), </li><li>`enabled_protocol`: The protocol used for the share. Possible values are `SMB` and `NFS`, </li><li>`metadata`: A mapping of MetaData for this File Share."
  type = map(object({
    name             = string
    quota            = number
    enabled_protocol = string
    metadata         = map(any)
    access_tier      = string
  }))
  default = {}
}

variable "tables" {
  description = "Map of the Storage Tables.<br></br><ul><li>`name`: The name of the storage table. Must be unique within the storage account the table is located."
  type = map(object({
    name = string
  }))
  default = {}
}

variable "tenant_id" {
  type        = string
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
  default     = null
}

variable "content_type" {
  type        = string
  description = "Specifies the content type for the Key Vault Secret."
  default     = "set"
}

variable "key_type" {
  type        = string
  description = "Specifies the Key Type to use for this Key Vault Key. Possible values are EC (Elliptic Curve), EC-HSM, RSA and RSA-HSM. Changing this forces a new resource to be created."
  default     = "RSA"
}

variable "key_size" {
  type        = string
  description = "Specifies the Size of the RSA key to create in bytes. For example, 1024 or 2048. Note: This field is required if key_type is RSA or RSA-HSM. Changing this forces a new resource to be created."
  default     = "4096"
}

variable "role_definition_name" {
  type        = string
  description = " The name of a built-in Role. Changing this forces a new resource to be created. Conflicts with role_definition_id."
  default     = "Key Vault Crypto Service Encryption User"
}

variable "soft_delete_blob_enabled" {
  type        = bool
  description = "Is the soft delete for blob enabled?"
  default     = false
}

variable "soft_delete_container_enabled" {
  type        = bool
  description = "Is the soft delete for container enabled?"
  default     = false
}

variable "soft_delete_share_enabled" {
  type        = bool
  description = "Is the soft delete for container enabled?"
  default     = false
}
variable "cors_rule_enabled" {
  type        = bool
  description = "Is cors rule enabled?"
  default     = false
}

variable "allowed_origins" {
  description = "A list of origin domains that will be allowed by CORS."
  type        = list(string)
  default     = ["*"]
}

variable "allowed_headers" {
  description = "A list of headers that are allowed to be a part of the cross-origin request"
  default     = ["*"]
  type        = list(string)
}

variable "allowed_methods" {
  description = "A list of http methods that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH."
  default     = ["DELETE", "GET", "HEAD", "MERGE", "POST", "OPTIONS", "PUT", "PATCH"]
  type        = list(string)
}

variable "exposed_headers" {
  description = "A list of response headers that are exposed to CORS clients."
  type        = list(string)
  default     = ["*"]
}

variable "max_age_in_seconds" {
  description = "The number of seconds the client should cache a preflight response."
  type        = number
  default     = 200
}

variable "IsKerbos" {
  description = "Is kerbos enabled?"
  type        = bool
  default     = false
}

variable "parent_id" {
  type        = string
  default     = null
  description = <<EOH
   the ID of the azure resource in which this resource is created.
   It supports different kinds of deployment scope for top level resources:

   resource group scope: parent_id should be the ID of a resource group

   management group scope: parent_id should be the ID of a management group

   extension scope: parent_id should be the ID of the resource you're adding the extension to.

   subscription scope: parent_id should be like /subscriptions/00000000-0000-0000-0000-000000000000

   tenant scope: parent_id should be /

   For child level resources, the parent_id should be the ID of its parent resource.
   Ex: subnet resource's parent_id is the ID of the vnet.
  EOH
}

variable "domainName" {
  type        = string
  description = "Active directory domain name to be used for authentication."
  default     = "domain.local"
}

variable "domainGuid" {
  type        = string
  description = "Active directory domain id to be used for authentication."
  default     = "a2875a11-9ba9-4ccd-a85b-8cf7717b496c"
}
