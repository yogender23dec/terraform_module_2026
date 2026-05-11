variable "rg-test2" {
  type = map(object({
    rg_name          = string
    location         = string
    nsg_name         = string
    vnetname         = string
    address_space    = list(string)
    dns_servers      = list(string)
    sub_name         = string
    address_prefixes = list(string)
  }))
}
