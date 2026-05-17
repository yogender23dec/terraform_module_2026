test_genric = {
  vnet1 = {
    rg_name    = "tcs"
    location   = "east us"
    managed_by = "terraform"
    env        = "test"
    storage    = "bhakuastorage1"
    nsg_name   = "tcs-security1"
    vnet_name  = "tcs-test"
    subnet = {
      sub1 = {
        "name"             = "test-tcs-frontend"
        "address_prefixes" = ["10.0.1.0/24", "10.0.2.0/24"]
      },
      sub2 = {
        "name"             = "test-tcs-backend"
        "address_prefixes"= ["10.0.3.0/24", "10.0.4.0/24"]
      }
    }
    address_space = ["10.0.0.0/16"]
    dns_server1   = ["10.0.0.6", "10.0.0.7"]
    security_rule = {
      rule1 = {
        "name"                       = "rule1"
        "priority"                   = 100
        "direction"                  = "Inbound"
        "access"                     = "Allow"
        "protocol"                   = "Tcp"
        "source_port_range"          = "*"
        "destination_port_range"     = "*"
        "source_address_prefix"      = "*"
        "destination_address_prefix" = "*"
      }
      rule2 = {
        "name"                       = "rule2"
        "priority"                   = 200
        "direction"                  = "Inbound"
        "access"                     = "Allow"
        "protocol"                   = "Tcp"
        "source_port_range"          = "*"
        "destination_port_range"     = "*"
        "source_address_prefix"      = "*"
        "destination_address_prefix" = "*"
      }
    }
  },
  vnet2 = {
    rg_name    = "hcl"
    location   = "west us"
    managed_by = "devops_learner"
    env        = "dev"
    storage    = "takuastorage1"
    nsg_name   = "hcl-security1"
    vnet_name  = "hcl-test"
    subnet = {
      sub1 = {
        "name"           = "hcl-sub2-frontend"
        address_prefixes = ["10.0.5.0/24", "10.0.6.0/24"]
      },
      sub2 = {
        "name"             = "hcl-sub2-backend"
        "address_prefixes" = ["10.0.7.0/24", "10.0.8.0/24"]
      }
    }
    address_space = ["10.0.0.0/16"]
    dns_server1   = ["10.0.0.8", "10.0.0.9"]

    security_rule = {
      rule1 = {
        "name"                       = "rule1"
        "priority"                   = 100
        "direction"                  = "Inbound"
        "access"                     = "Allow"
        "protocol"                   = "Tcp"
        "source_port_range"          = "*"
        "destination_port_range"     = "*"
        "source_address_prefix"      = "*"
        "destination_address_prefix" = "*"
      }
      rule2 = {
        "name"                       = "rule2"
        "priority"                   = 200
        "direction"                  = "Inbound"
        "access"                     = "Allow"
        "protocol"                   = "Tcp"
        "source_port_range"          = "*"
        "destination_port_range"     = "*"
        "source_address_prefix"      = "*"
        "destination_address_prefix" = "*"
      }
    }
  }
}
