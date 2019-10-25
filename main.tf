terraform {
  required_version = ">= 0.12.0"
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  count = length(var.vnet_cidrs) == 0 ? 0 : 1
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_cidrs
}

resource "azurerm_subnet" "subnets" {
  for_each = toset(var.vnet_subnet_cidrs)
  name                 = "${azurerm_virtual_network.vnet[0].name}-subnet-${index(var.vnet_subnet_cidrs, each.value)}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet[0].name
  address_prefix       = each.value
}