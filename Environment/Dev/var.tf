variable "rgname" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "storage"{
  type = map(object({
    name = string
    tier             = string
  replication= string
  location = string
  }))
}

variable "nsg" {
  type = map(object({
    name     = string
    location = string
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

variable "vnet_tcs" {
  type = map(object({
    vnet_name     = string
    location = string
    address_space = list(string)
    dns_server1   = list(string)
    subnet = map(object({
      name             = string
      address_prefixes = list(string)
      security_group   = string
    }))
  }))
}