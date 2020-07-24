variable "aws_account_id" {
  description = "The account ID you are building into."
  type        = "string"
}

variable "region" {
  description = "The AWS region the state should reside in."
  type        = "string"
}

variable "environment" {
  description = "The name of the environment, e.g. Production, Development, etc."
  type        = "string"
}

variable "layer" {
  description = "The name of the layer."
  type        = "string"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = "string"
}

variable "cidr_range" {
  description = "CIDR range for the VPC"
  type        = "string"
}

variable "private_subnets" {
  description = "An array of CIDR ranges to use for private subnets"
  type        = "list"
}

variable "public_subnets" {
  description = "An array of CIDR ranges to use for public subnets"
  type        = "list"
}
