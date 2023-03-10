variable "resource_group_name" {
  type        = string
  description = "Specifies the Name of the Resource Group within which the Private Endpoint should exist."
}

variable "location" {
  type        = string
  description = "The supported Azure location where the resource exists."
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint."
}

variable "privateendpoint_name" {
  type        = string
  description = "Specifies the Name of the Private Endpoint."
}

variable "custom_network_interface_name" {
  type        = string
  description = "The custom name of the network interface attached to the private endpoint."
}

variable "private_dns_zone_group_name" {
  type        = string
  description = "Specifies the Name of the Private DNS Zone Group."
}

variable "ipconfiguration_name" {
  type        = string
  description = "Specifies the Name of the IP Configuration."
  default     = null
}

variable "private_ip_address" {
  type        = string
  description = "Specifies the static IP address within the private endpoint's subnet to be used."
  default     = null
}

variable "subresource_name" {
  type        = string
  description = "Specifies the subresource this IP address applies to."
  default     = null
}

variable "private_connection_resource_id" {
  type        = string
  description = "The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to."
}

variable "subresource_names" {
  type        = list(string)
  description = "A list of subresource names which the Private Endpoint is able to connect to. "
}

variable "is_manual_connection" {
  type        = string
  description = "Does the Private Endpoint require Manual Approval from the remote resource owner"
  default     = "false"
}

variable "member_name" {
  type        = string
  description = "Specifies the member name this IP address applies to."
  default     = "default"
}
