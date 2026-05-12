test_genric = {
  vnet1 = {
    rg_name          = "tcs"
    location         = "east us"
    managed_by       = "terraform"
    env              = "test"
    storage          = "bhakuastorage1"
    nsg_name         = "tcs-security1"
    vnet_name        = "tcs-test"
    subnet_name      = "tcs-sub1"
    address_space    = ["10.0.0.0/16"]
    dns_server1       = ["10.0.0.6", "10.0.0.7"]
    address_prefixes = ["10.0.0.4/24", "10.0.0.5/24"]
  }
  vnet2 = {
    rg_name          = "hcl"
    location         = "west us"
    managed_by       = "devops_learner"
    env              = "dev"
    storage          = "takuastorage1"
    nsg_name         = "hcl-security1"
    vnet_name        = "hcl-test"
    subnet_name      = "hcl-sub2"
    address_space    = ["10.0.0.0/16"]
    dns_server1      = ["10.0.0.8", "10.0.0.9"]
    address_prefixes = ["10.0.0.6/24", "10.0.0.7/24"]
  }
}
