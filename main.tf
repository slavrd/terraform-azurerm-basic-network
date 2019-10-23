terraform {
  required_version = ">= 0.12.0"
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}