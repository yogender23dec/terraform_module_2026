variable "vnets" {

  type = map(object({
    vnet_name     = string
       resource_group_key    = string
    location      = string
    address_space = list(string)
    dns           = list(string)
  }))
}
