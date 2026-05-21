resource "azurerm_storage_account" "storage_bk1" {
    for_each = var.storage
  name                     = each.value.name
  resource_group_name      = "rg-${each.key}"
  location                 = each.value.location
  account_tier             = each.value.tier
  account_replication_type = each.value.replication
  tags = {
    "environment" = "test"
    project       = "devops_learner"
  }
}
