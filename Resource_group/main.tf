resource "azurerm_resource_group" "rg-test" {
  name       = var.rg_name1
  location   = "central india"
  managed_by = "we are devops learner"
  tags = {
    "environment" = "test"
    "project"     = "devops_learner"
  }
}

resource "azurerm_resource_group" "rg-dev" {
  name       = var.rg_name2
  location   = "central india"
  managed_by = "we are devops learner"
  tags = {
    "environment" = "dev"
    "project"     = "devops_learner"
  }
}

resource "azurerm_storage_account" "storage-test1" {
  name                     = var.bhakuastorage123
  resource_group_name      = azurerm_resource_group.rg-test.name
  location                 = azurerm_resource_group.rg-test.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    "environment" = "test"
    project       = "devops_learner"
  }
}

resource "azurerm_storage_account" "storage-dev" {
  name                     = var.takuastorage123
  resource_group_name      = azurerm_resource_group.rg-dev.name
  location                 = azurerm_resource_group.rg-dev.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    "environment" = "dev"
    project       = "devops_learner"
  }
}