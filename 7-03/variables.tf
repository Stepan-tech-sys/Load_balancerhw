variable "flow" {
  type    = string
  default = "24-01"
}

variable "cloud_id" {
  type    = string
  default = "b1gl04np3q0i69gq37a2"
}
variable "folder_id" {
  type    = string
  default = "b1g1ksramu1u9utdocjq"
}

variable "test" {
  type = map(number)
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }
}

