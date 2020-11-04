module "testmodule" {
  source            = "../../"
  rg_name           = var.rg_name
  location          = var.location
  vnet_name         = var.vnet_name
  vnet_cidrs        = var.vnet_cidrs
  vnet_subnet_cidrs = var.vnet_subnet_cidrs
  common_tags       = var.common_tags
}