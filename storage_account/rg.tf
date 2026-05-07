resource "azurerm_resource_group" "rg_dev1" {
    for_each = (var.rg-test1)
    name = each.value.rg_name
    location = each.value.location
}