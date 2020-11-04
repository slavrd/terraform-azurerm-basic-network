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
| vnet_cidrs | `list(string)` || List of CIDRs for the Azure virtual network address spaces. |
| vnet_subnet_cidrs | `list(string)` || List of CIDRs for subnets creation. It's meaningless to set this if vnet_address_space is not set also. It's the user's responsibility to ensure that the subnets are calculated correctly. |

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
## Testing

Tests for the module are set up using `kitchen` and `kitchen-terraform` to run `inspec` tests.

Terraform variables which control the resources created during the test are set up in `test/fixtures/test.tfvars` file.

### Prerequisites

To run the tests you will need the following

* Have Ruby installed, version `~> 2.7.2`. It is recommended to use a ruby versions manager like `rbenv` and not your system ruby installation.
* Have the Ruby Gems specified in the `Gemfile` file installed. It is recommended to use `bundler`.

  ```bash
  gem install bundler
  bundle install
  ```
* Have Terraform installed, version `>= 0.13`.

### Running tests

* Set up the credentials for the AzureRM provider as described [here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#authenticating-to-azure). For example, using the Azure CLI:

  ```bash
  az login
  ```

* Set up Azure credentials for Inspec as described [here](https://docs.chef.io/inspec/platforms/#azure-platform-support-in-inspec). For example, using Service Principal and Client Secret in Environment variables:

  ```bash
  export AZURE_CLIENT_ID='xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx'
  export AZURE_CLIENT_SECRET='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
  export AZURE_SUBSCRIPTION_ID='xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx'
  export AZURE_TENANT_ID='xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx'
  ```
* (optional) Adjust Terraform input variables in `test/fixtures/test.tfvars`
* Use `kitchen` to execute the tests
  * Converge the testing environment.

  ```bash
  bundle exec kitchen converge
  ```

  * Execute the tests.

  ```bash
  bundle exec kitchen verify
  ```

  * Destroy the testing environment.

  ```bash
  bundle exec kitchen destroy
  ```