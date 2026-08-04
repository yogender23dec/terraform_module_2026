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
