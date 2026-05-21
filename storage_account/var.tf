variable "storage"{
  type = map(object({
    name = string
    tier             = string
  replication= string
  location = string
  }))
}