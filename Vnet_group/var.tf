variable "test_genric" {
  type = map(object({
    rg_name          = string
    location         = string
    managed_by       = string
    env              = string
    storage          = string
    nsg_name         = string
    vnet_name        = string
    subnet_name      = string
    address_space    = list(string)
    dns_server1       = list(string)
    address_prefixes = list(string)
  }))
}
