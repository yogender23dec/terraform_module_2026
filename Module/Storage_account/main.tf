resource "azurerm_storage_account" "storageblock" {
  for_each                 = var.storages
  name                     = each.value.storage_name
  resource_group_name      = each.value.resource_group_key
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.replication_type
}
