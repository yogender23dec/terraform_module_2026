variable "rgname" {

  type = map(object({
    rg_name  = string
    location = string
  }))
}

variable "storages" {
  
  type = map(object({
    storage_name        = string
        resource_group_key = string
    location            = string
    account_tier        = string
    replication_type    = string
  }))
}

variable "vnets" {

  type = map(object({
    vnet_name          = string
    resource_group_key = string
    location           = string
    address_space      = list(string)
    dns                = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    subnet_name         = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes    = list(string)
  }))
}

variable "nsg" {
  type = map(object({
    nsg_name               = string
    resource_group_name = string
    location           = string
    security_rule = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}


