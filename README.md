# Terraform basic Azure infra

Terraform code for creating basic Azure infrastructure.

The code currently creates an Azure `resource group` and optionally an Azure `virtual network` and `subnets` in this virtual network.

## Usage

* Install [Terraform](https://www.terraform.io/downloads.html).
* Setup Azure authentication as described [here](https://www.terraform.io/docs/providers/azurerm/index.html#authenticating-to-azure).
* Set up terraform variables. Check `input.tf` for available variables and their description.

## TODO

- [ ] add tests
- [ ] add common tags
