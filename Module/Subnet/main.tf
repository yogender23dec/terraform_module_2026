# # This block is used for Subnets
# resource "azurerm_subnet" "subnetblock" {
#   for_each            = var.subnets
#   name                = each.value.subnet_name
#   resource_group_name = each.value.key
#   virtual_network_name = each.value.virtual_network_name
#   address_prefixes    = each.value.address_prefixes
  
# }
