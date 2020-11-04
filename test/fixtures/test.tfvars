rg_name  = "kitchen-test-basic-network"
location = "westeurope"
tags = {
  project = "kitchen-test-basic-network"
}

vnet_name         = "kitchen-test-basic-network-vnet"
vnet_cidrs        = ["172.30.0.0/16"]
vnet_subnet_cidrs = ["172.30.0.0/24", "172.30.1.0/24"]