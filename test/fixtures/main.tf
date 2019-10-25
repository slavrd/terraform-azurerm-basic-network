terraform {
  required_version = "~> 0.12.12"
}

module "testmodule" {
    source = "../../"
    rg_name = var.rg_name
    location = var.location
    vnet_name = var.vnet_name
    vnet_cidrs = var.vnet_cidrs
    vnet_subnet_cidrs = var.vnet_subnet_cidrs
}