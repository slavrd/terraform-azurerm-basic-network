resource "azurerm_resource_group" "rg" {
  count    = var.rg_create ? 1 : 0
  name     = var.rg_name
  location = var.location
  tags     = var.common_tags
}

locals {
  rg_name  = var.rg_create ? azurerm_resource_group.rg[0].name : var.rg_name
  location = var.rg_create ? azurerm_resource_group.rg[0].location : var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = local.location
  resource_group_name = local.rg_name
  address_space       = var.vnet_cidrs
  tags                = var.common_tags
}

resource "azurerm_subnet" "subnets" {
  for_each             = toset(var.vnet_subnet_cidrs)
  name                 = "${azurerm_virtual_network.vnet.name}-subnet-${index(var.vnet_subnet_cidrs, each.value)}"
  resource_group_name  = local.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}