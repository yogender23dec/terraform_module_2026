resource "azurerm_storage_account" "storage_bk1" {
    for_each = (var.rg-test1)
  name                     = each.value.storage_name
  resource_group_name      = azurerm_resource_group.rg_dev1[each.key].name
  location                 = azurerm_resource_group.rg_dev1[each.key].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    "environment" = "dev"
    project       = "devops_learner"
  }
}
