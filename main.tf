resource "azurerm_resource_group" "rg" {
  count    = var.rg_create ? 1 : 0
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

locals {
  rg_name  = var.rg_create ? azurerm_resource_group.rg[0].name : var.rg_name
  location = var.rg_create ? azurerm_resource_group.rg[0].location : var.location
}

resource "azurerm_virtual_network" "vnet" {
  count               = length(var.vnet_cidrs) == 0 ? 0 : 1
  name                = var.vnet_name
  location            = local.location
  resource_group_name = local.rg_name
  address_space       = var.vnet_cidrs
  tags                = var.tags
}

resource "azurerm_subnet" "subnets" {
  for_each             = toset(var.vnet_subnet_cidrs)
  name                 = "${azurerm_virtual_network.vnet[0].name}-subnet-${index(var.vnet_subnet_cidrs, each.value)}"
  resource_group_name  = local.rg_name
  virtual_network_name = azurerm_virtual_network.vnet[0].name
  address_prefix       = each.value
}