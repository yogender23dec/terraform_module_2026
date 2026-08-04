#created a resource group using a for_each meta argument
resource "azurerm_resource_group" "rg_block1" {
  for_each = var.rgname
  name       = "rg-${each.value.name}"
  location   = each.value.location
}
