variable "rg-test1"{
  type = map(object({
    rg_name = string
    location = string
    storage_name = string
  }))
}