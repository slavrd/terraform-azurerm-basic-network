output "rg" {
    description = "Properties of the created Azure resource group."
    value = module.testmodule.rg
}

output "vnet" {
    description = "Properties of the created Azure virtual network."
    value = module.testmodule.vnet
}

output "subnets" {
    description = "Properties of the created Azure subnets."
    value = module.testmodule.subnets
}