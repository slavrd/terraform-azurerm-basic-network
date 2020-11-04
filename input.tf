variable "rg_name" {
  type        = string
  description = "Name of the resource group to be created."
}

variable "rg_create" {
  type        = string
  description = "Name of the resource group to be created."
  default     = true
}

variable "location" {
  type        = string
  description = "The Azure location in which to create the resources."
}

variable "common_tags" {
  type        = map(string)
  description = "A map that represents tagname/value pairs. Assign null to not set any tags."
  default     = {}
}

variable "vnet_name" {
  type        = string
  description = "Name of the Azure vnet."
  default     = null
}

variable "vnet_cidrs" {
  type        = list(string)
  description = "List of CIDR ranges for the Azure virtual network address spaces. Leave to default if don't want to create a vnet."
}

variable "vnet_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR ranges for subents creation. It's meaningless to set this if vnet_address_space is not set also. It's the user's responsibility to make the subnetting calculations correctly."
  default     = []
}