variable "storages" {
  type = map(object({
    storage_name                = string
        resource_group_key = string
    location            = string
    account_tier        = string
    replication_type    = string
  }))
}



