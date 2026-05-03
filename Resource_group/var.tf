variable "rg_name1" {
  type        = string
  description = "this used for rg-test"
}

variable "rg_name2" {
  type        = string
  description = "this used for rg-dev"
}


variable "bhakuastorage123" {
  type        = string
  description = "this used for storage account"
}

variable "takuastorage123" {
  type        = string
  description = "this used for storage account"
}

variable "rg_name3" {
  type        = string
  description = "this used for rg-dev"
}

variable "rg_name4" {
  type        = list(string)
  description = "this used for rg-dev"
}

variable "rg_name5" {
  type = map(object({
  name = string
  location = string
  }))
} 
