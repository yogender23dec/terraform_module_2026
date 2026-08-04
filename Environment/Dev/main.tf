module "resource_group" {
  source = "../../Module/Resource_Group"
  rgname = var.rgname
}

module "storageaccount" {
  
depends_on = [module.resource_group]
source = "../../Module/Storage_account"

 storages = var.storages

}

module "vnet_module" {
  depends_on = [module.resource_group]
  source     = "../../Module/Vnet_group"
  vnets      = var.vnets

}

module "subnetmod1" {
  for_each   = var.subnets
  depends_on = [module.vnet_module]
  source     = "../../Module/Subnet"
  subnets    = var.subnets

}


