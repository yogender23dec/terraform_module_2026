variable "test_genric" {
  type = map(object({
    rg_name       = string
    location      = string
    managed_by    = string
    env           = string
    storage       = string
    nsg_name      = string
    vnet_name     = string
    address_space = list(string)
    dns_server1   = list(string)

    subnet = map(object({
      name             = string
      address_prefixes = list(string)
    }))

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
