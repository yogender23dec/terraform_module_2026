# resource "azurerm_resource_group" "rg-test1" {
#   name       = var.rg_name1
#   location   = "central india"
#   managed_by = "we are devops learner"
#   tags = {
#     "environment" = "test"
#     "project"     = "devops_learner"
#   }
# }

# resource "azurerm_resource_group" "rg-dev" {
#   name       = var.rg_name2
#   location   = "central india"
#   managed_by = "we are devops learner"
#   tags = {
#     "environment" = "dev"
#     "project"     = "devops_learner"
#   }
# }

# resource "azurerm_storage_account" "storage-test1" {
#   name                     = var.bhakuastorage123
#   resource_group_name      = azurerm_resource_group.rg-test1.name
#   location                 = azurerm_resource_group.rg-test1.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   tags = {
#     "environment" = "test"
#     project       = "devops_learner"
#   }
# }

# resource "azurerm_storage_account" "storage-dev" {
#   name                     = var.takuastorage123
#   resource_group_name      = azurerm_resource_group.rg-dev.name
#   location                 = azurerm_resource_group.rg-dev.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   tags = {
#     "environment" = "dev"
#     project       = "devops_learner"
#   }
# }

#created Rresource group block using count meta argument
resource "azurerm_resource_group" "rg-block1" {
  count = 2
  name       = "rg-sprite-${var.rg_name4[count.index]}"
  location   = "East Us"
  managed_by = "we are devops learner"
  tags = {
    "environment" = var.rg_name4[count.index]
    "project"     = "devops_learner"
  }
}

#created a resource group using a for_each meta argument
resource "azurerm_resource_group" "rg-block2" {
  for_each = var.rg_name5
  name       = each.value.name
  location   = each.value.location
}
