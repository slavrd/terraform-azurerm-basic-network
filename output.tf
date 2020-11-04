output "rg_name" {
  description = "The name of the Azure resource group created and/or used by the module."
  value       = var.rg_create ? azurerm_resource_group.rg[0].name : var.rg_name
}

output "location" {
  description = "The Azure location used for the resources."
  value       = var.rg_create ? azurerm_resource_group.rg[0].location : var.location
}

output "vnet" {
  description = "Properties of the created Azure virtual network."
  value       = azurerm_virtual_network.vnet
}

output "subnets" {
  description = "Properties of the created Azure subnets."
  value       = values(azurerm_subnet.subnets)
}