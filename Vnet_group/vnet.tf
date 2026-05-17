# this block is used for resource group
resource "azurerm_resource_group" "rgs" {
  for_each   = var.test_genric
  name       = "rg-${each.value.rg_name}"
  location   = each.value.location
  managed_by = each.value.managed_by
  tags = {
    "environment" = each.value.env
  }
}

#this block used for storage account
resource "azurerm_storage_account" "storage-block" {
  for_each                 = var.test_genric
  name                     = each.value.storage
  resource_group_name      = azurerm_resource_group.rgs[each.key].name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# This block used for network security group

resource "azurerm_network_security_group" "nsg_foreach" {

  for_each            = var.test_genric
  name                = "nsg-${each.value.nsg_name}"
  resource_group_name = azurerm_resource_group.rgs[each.key].name
  location            = each.value.location

  dynamic "security_rule" {
    for_each = each.value.security_rule
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

#This block is used for virtual network

resource "azurerm_virtual_network" "vnet_foreach" {
  depends_on          = [azurerm_network_security_group.nsg_foreach]
  for_each            = var.test_genric
  name                = "vnet-${each.value.vnet_name}"
  resource_group_name =  azurerm_resource_group.rgs[each.key].name
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
