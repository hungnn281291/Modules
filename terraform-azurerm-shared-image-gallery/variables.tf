variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Shared Image Gallery."
}

variable "location" {
  type        = string
  description = "The region where the resource will be deployed."
}

variable "shared_image_gallery_name" {
  type        = string
  description = "The name of the Shared Image Gallery."
}

variable "description" {
  type        = string
  description = "The description of Shared Image Gallery."
}

variable "tags" {
  type        = map(string)
  description = "Tags of the Shared Image Gallery."
  default     = null
}








