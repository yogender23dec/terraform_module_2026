module "rgs" {
    source = "../../Resource_group"
    rgname = var.rgname
}

module "storage_account" {
    depends_on = [module.rgs]
    source = "../../storage_account"
    storage = var.storage
}

module "nsg" {
    depends_on = [module.rgs]
    source = "../../NSG"
    nsg = var.nsg
}

module "vnet" {
    depends_on = [module.nsg]
    source = "../../Vnet_group"
    vnet_tcs = var.vnet_tcs
}