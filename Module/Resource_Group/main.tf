resource "azurerm_resource_group" "rgblock1" {
  for_each = var.rgname
  name     = "rg-${each.value.rg_name}"
  location = each.value.location
}
