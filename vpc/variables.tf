variable "cidr" {
  description = "VPC CIDR block"
}

variable "project" {
}

variable "environment" {
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "database_subnets" {
  type = list(string)
}

variable "availability_zones" {
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "aws_region" {
  default = "eu-west-1"
}

