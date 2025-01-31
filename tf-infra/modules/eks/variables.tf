variable "vpc_id" {
  type = string
  default = ""
}

variable "subnet_ids" {
  type = list(string)
}

variable "environment" {
  type = string
  default = ""
}

variable "region" {
  type = string
  default = ""
}
