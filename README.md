# Terraform basic Azure infra

Terraform code for creating basic Azure infrastructure.

The code currently creates an Azure `resource group` and optionally an Azure `virtual network` and `subnets` in this virtual network.

## Usage

* Install [Terraform](https://www.terraform.io/downloads.html).
* Setup Azure authentication as described [here](https://www.terraform.io/docs/providers/azurerm/index.html#authenticating-to-azure).
* Set up terraform variables. Check `input.tf` for available variables and their description.

## Testing

Testing is done with KitchenCI. Since the resources are very basic the main test is successfully converging the test environments. Some basic tests are run on the terraform outputs.

Testing is done by using a fixture to call the configuration as a terraform sub-module. It is located in `test/fixtures`. Variables for the tests can be set in `test/fixtures/test.tfvars`

### Usage

* Ensure ruby version satisfies the version constraint in the `Gemfile`. Can use a ruby versions manager like [`rbenv`](https://github.com/rbenv/rbenv).
* Install gems form the included `Gemfile` with ruby [bundler](https://bundler.io/) - `bundle install`.
  
* Converge test environment - `bundle exec kitchen converge`
* Run InSpec tests - `bundle exec kitchen verify`
* Destroy test environment - `bundle exec kitchen destroy`

## TODO

- [x] add tests
- [x] add common tags
