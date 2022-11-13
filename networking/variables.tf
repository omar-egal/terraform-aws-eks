#---networking/variables.tf---

variable "vpc_cidr" {
  type = string
}

variable "access_ip" {}

variable "public_cidrs" {
  type = list(any)
}

variable "public_sn_count" {
  type = number
}

variable "max_subnets" {
  type = number
}
