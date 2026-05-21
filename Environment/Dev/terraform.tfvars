# for each variable
rgname = {
  rg1 = {
    name     = "test-tcs"
    location = "East Us"
  },
  rg2 = {
    name     = "test-hcl"
    location = "Central India"
  }
}

  storage = {
      stg1 = {
          name = "teststoragetcs1"
          tier = "Standard"
          replication = "LRS"
          location = "Central India"
      },
      stg2 = {
        name = "teststoragehcl2"
          tier = "Standard"
          replication = "LRS"  
          location = "East US"
      }
  }

nsg = {
  nsg1 = {
    name     = "test-tcs"
    location = "East Us"

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
  nsg2 = {
    name     = "test-hcl"
    location = "Central India"

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

vnet_tcs = {
  vnet1 = {
    vnet_name     = "tst-tcs"
    location      = "central india"
    address_space = ["10.0.0.0/16"]
    dns_server1   = ["10.0.0.6", "10.0.0.7"]
    subnet = {
      sub1 = {
        name             = "test-tcs-frontend"
        address_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
        security_group   = "nsg-test-tcs"
      },
      sub2 = {
        name             = "test-tcs-backend"
        address_prefixes = ["10.0.3.0/24", "10.0.4.0/24"]
        security_group   = "nsg-test-tcs"
      }
    }
  },
  vnet2 = {
    vnet_name     = "tst-hcl"
    location      = "central india"
    address_space = ["10.0.0.0/16"]
    dns_server1   = ["10.0.0.6", "10.0.0.7"]
    subnet = {
      sub1 = {
        name             = "test-hcl-frontend"
        address_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
        security_group   = "nsg-test-hcl"
      },
      sub2 = {
        name             = "test-hcl-backend"
        address_prefixes = ["10.0.3.0/24", "10.0.4.0/24"]
        security_group   = "nsg-test-hcl"
      }
    }
  }
}
