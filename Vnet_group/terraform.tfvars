rg-test2 = {
  vnet1 = {
    rg_name          = "rg-dev"
    location         = "east us"
    nsg_name         = "tcs-dev"
    vnetname         = "dev-ka-virtualnetwork"
    address_space    = ["10.0.0.0/16"]
    dns_servers      = ["10.0.0.4", "10.0.0.5"]
    sub_name         = "tcs-dev"
    address_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
  }
  vnet2 = {
    rg_name          = "rg-test"
    location         = "west us"
    nsg_name         = "tcs-test"
    vnetname         = "test-ka-virtualnetwork"
    address_space    = ["10.0.0.0/16"]
    dns_servers      = ["10.0.0.6", "10.0.0.7"]
    sub_name         = "tcs-test"
    address_prefixes = ["10.0.3.0/24", "10.0.4.0/24"]
  }
}

