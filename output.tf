output "rg" {
  description = "Properties of the created Azure resource group."
  value       = try(azurerm_resource_group.rg[0], {})
}

output "vnet" {
  description = "Properties of the created Azure virtual network."
  value       = azurerm_virtual_network.vnet
}

output "subnets" {
  description = "Properties of the created Azure subnets."
  value       = values(azurerm_subnet.subnets)
}