variable "rg_name" {
  type        = string
  description = "Name of the resource group to be created."
}

variable "location" {
  type        = string
  description = "The Azure location in which to create the resources."
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to assign to all resources."
  default     = {}
}

variable "vnet_name" {
  type        = string
  description = "Name of the Azure vnet."
}

variable "vnet_cidrs" {
  type        = list(string)
  description = "List of CIDR ranges for the Azure virtual network address spaces."
}

variable "vnet_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR ranges for subnets creation. It's meaningless to set this if vnet_address_space is not set also. It's the user's responsibility to ensure that the subnets are calculated correctly."
  default     = []
}