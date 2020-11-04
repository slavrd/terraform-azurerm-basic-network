# Terraform - Basic Azure Network

Terraform code for creating basic Azure network.

The module will create:

* (optional) Azure Resource Group to hold the resources or can also use an existing one.
* Azure Virtual Network.
* Azure Subnets part of the Virtual Network.

## Requirements

Requirements for the module:

* Terraform CLI, version `>= 0.13`
* AzureRM Terraform provider, `~> 2.30`

## Input Variables

The input variables available for the module are in the table below.

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| rg_name | `string` | | Name of the resource group to be used/created. |
| rg_create | `bool` | `true` | Whether to create the resource group. |
| location | `string` | | The Azure location in which to create the resources. |
| common_tags | `map(string)` | `{}` | Common tags to assign to all resources. |
| vnet_name | `string` | | Name of the Azure vnet. |
| vnet_cidrs | `list(string)` || List of CIDR ranges for the Azure virtual network address spaces. |
| vnet_subnet_cidrs | `list(string)` || List of CIDR ranges for subnets creation. It's meaningless to set this if vnet_address_space is not set also. It's the user's responsibility to ensure that the subnets are calculated correctly. |

## Outputs

The outputs declared by the module are in the table below.

| Output | Type | Description |
|--------|------|-------------|
| rg_name | `string` | The name of the Azure resource group created and/or used by the module.. |
| location | `string` | The Azure location used for the resources. |
| vnet | `object(any)` | Properties of the created Azure virtual network. |
| subnets | `map(object(any))` | A mapping between the input CIDRs and the created subnets. |

## Example Module Declaration

An example of how the module can be used.

```hcl
module "basic_network" {
  source = "git::https://github.com/slavrd/terraform-azurerm-basic-network.git"

  rg_name           = "basic-network-example"
  location          = "westeurope"
  vnet_name         = "basic-network-example-vnet"
  vnet_cidrs        = ["172.16.0.0/16"]
  vnet_subnet_cidrs = ["172.16.0.0/24", "172.16.1.0/24"]

  common_tags = {
      project = "basic-network-example"
  }
}
```
