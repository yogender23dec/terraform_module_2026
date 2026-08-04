rgname = {
  rg1 = {
    rg_name  = "tcs-dev"
    location = "East Us"
  },
  rg2 = {
    rg_name     = "hcl-prod"
    location = "West Us"
  }
}

storages = {
  stg1 = {
    storage_name     = "tcsstorage123"
    resource_group_key = "rg1"
    location         = "East Us"
    account_tier     = "Standard"
    replication_type = "LRS"
  },
  stg2 = {
    storage_name     = "hclstorage1234"
    resource_group_key = "rg2"
    location         = "West Us"
    account_tier     = "Standard"
    replication_type = "LRS"
  }
}

vnets = {
  vnet1 = {
    vnet_name     = "tcsdev1"
    resource_group_key = "rg1"
    location      = "East Us"
    address_space = ["10.0.0.0/16"]
    dns           = ["10.0.0.6", "10.0.0.7"]
  },
  vnet2 = {
    vnet_name     = "hclprod1"
    resource_group_key = "rg2"
    location      = "West Us"
    address_space = ["10.0.0.0/16"]
    dns           = ["10.0.0.6", "10.0.0.7"]
  }
}

subnets = {
  sub1 = {
    subnet_name      = "test-tcs-frontend"
    resource_group_name = "rg-tcs-dev"
    address_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
    virtual_network_name        = "vnet1"
security_group_key = "nsg1"
  },
  sub2 = {
    subnet_name      = "test-tcs-backend"
    resource_group_name = "rg-tcs-dev"
    address_prefixes = ["10.0.3.0/24", "10.0.4.0/24"]
    virtual_network_name         = "vnet1"
    security_group_key = "nsg1"
  },
  sub3 = {
    subnet_name      = "prod-hcl-frontend"
    resource_group_name = "rg-hcl-prod"
    address_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
    virtual_network_name         = "vnet2"
security_group_key = "nsg2"
  },
  sub4 = {
    subnet_name      = "prod-hcl-backend"
    resource_group_name = "rg-hcl-prod"
    address_prefixes = ["10.0.3.0/24", "10.0.4.0/24"]
    virtual_network_name         = "vnet2"
    security_group_key = "nsg2"
  }
}

nsg = {
  nsg1 = {
    nsg_name     = "test-tcs"
    location = "East Us"
    resource_group_name = "rg-hcl-prod"

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
      },
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
  nsg2 = {
    nsg_name     = "test-hcl"
    location = "West Us"
    resource_group_name = "rg-hcl-prod"

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
      },
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
