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
  depends_on          = [azurerm_resource_group.rgs]
  for_each            = var.test_genric
  name                = "nsg-${each.value.nsg_name}"
  resource_group_name = each.value.rg_name
  location            = each.value.location
}

#This block is used for virtual network

resource "azurerm_virtual_network" "vnet_foreach" {
  depends_on           = [azurerm_network_security_group.nsg_foreach]
  for_each            = var.test_genric
  name                = "vnet-${each.value.vnet_name}"
  resource_group_name = each.value.rg_name
  location            = each.value.location
  address_space       = each.value.address_space
  dns_servers          = each.value.dns_server1

  subnet {
    name             = "${each.value.subnet_name}-frontend"
    address_prefixes = each.value.address_prefixes
  }

  subnet {
    name             = "${each.value.subnet_name}-backend"
    address_prefixes = each.value.address_prefixes
    security_group   = azurerm_network_security_group.nsg_foreach[each.key].id
  }
}
