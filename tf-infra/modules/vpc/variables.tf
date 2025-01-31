variable "environment" {
  type = string
  default = ""
}

variable "region" {
  type = string
  default = ""
}

variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}

