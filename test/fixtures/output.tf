output "rg_name" {
  description = "The name of the Azure resource group created and/or used by the module."
  value       = module.testmodule.rg_name
}

output "location" {
  description = "The Azure location used for the resources."
  value       = module.testmodule.location
}

output "vnet" {
  description = "Properties of the created Azure virtual network."
  value       = module.testmodule.vnet
}

output "subnets" {
  description = "A mapping bettween the input CIDRs and the created subnets."
  value       = module.testmodule.subnets
}