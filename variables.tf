#---root/variables.tf---
variable "aws_region" {
  default = "us-east-1"
}

variable "access_key" {}

variable "secret_key" {}

variable "access_ip" {
  sensitive = true
  
}
