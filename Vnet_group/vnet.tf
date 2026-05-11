terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# below code is for resource group
resource "azurerm_resource_group" "rgs_foreach" {
  for_each = var.rg-test2
  name     = each.value.rg_name
  location = each.value.location
}

# below code is for network security group
resource "azurerm_network_security_group" "nsgs_foreach" {
 depends_on = [azurerm_resource_group.rgs_foreach]
  for_each            = var.rg-test2
  name                = "nsg-${each.value.sub_name}"
  location            = each.value.location
  resource_group_name = each.value.rg_name
}
# below code is for creating virtual network
resource "azurerm_virtual_network" "vnet-tcs" {
  depends_on =[azurerm_network_security_group.nsgs_foreach]
  for_each            = var.rg-test2
  name                = "vnet-${each.value.sub_name}"
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  subnet {
    name             = "${each.value.sub_name}-frontend"
    address_prefixes = [each.value.address_prefixes[0]]
  }

  subnet {
    name             = "${each.value.sub_name}-backend"
    address_prefixes = [each.value.address_prefixes[1]]
    security_group   = azurerm_network_security_group.nsgs_foreach[each.key].id
  }
  }