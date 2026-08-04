output "name" {
  value = {
    for k, rg in azurerm_resource_group.rgblock1 :
    k => rg.name
  }
}


