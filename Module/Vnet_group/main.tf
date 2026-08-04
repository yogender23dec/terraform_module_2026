#this block is used for virtual network
resource "azurerm_virtual_network" "vnetblock" {
  for_each            = var.vnets
  name                = "vnet-${each.value.vnet_name}"
  resource_group_name = each.value.key
  location            = each.value.location
  address_space       = each.value.address_space
  dns_servers         = each.value.dns
}

