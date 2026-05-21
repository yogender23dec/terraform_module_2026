#This block is used for virtual network

resource "azurerm_virtual_network" "vnet_foreach" {
  for_each            = var.vnet_tcs
  name                = "vnet-${each.value.vnet_name}"
  resource_group_name = "rg-${each.key}"
  location            = each.value.location
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_server1

  dynamic "subnet" {
    for_each = each.value.subnet
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
      security_group   = azurerm_network_security_group.nsg_foreach[each.key].id
    }
  }
}
