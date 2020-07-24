/**
 * # 000base
 */

provider "aws" {
  version             = "~> 2.17"
  region              = "${var.region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

provider "random" {
  version = "~> 1.0"
}

provider "template" {
  version = "~> 1.0"
}

provider "tls" {
  version = "~> 2.1.1"
}

# terraform block cannot be interpolated; sample provided as output of _main
terraform {
  version = "0.11.14"

  backend "s3" {
    # this key must be unique for each layer!
    bucket  = "162198556136-build-state-bucket-layers-sample"
    key     = "terraform.000base.tfstate"
    region  = "ap-southeast-2"
    encrypt = "true"
  }
}

data "aws_availability_zones" "current" {}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "terraform_remote_state" "main_state" {
  backend = "local"

  config = {
    path = "../../_main/terraform.tfstate"
  }
}

locals {
  tags = {
    Environment     = "${var.environment}"
    ServiceProvider = "Rackspace"
    Layer           = "${var.layer}"
    Terraform       = "true"
  }
}

######## Base Network setup ########

module "vpc" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork//?ref=v0.0.10"

  az_count            = "${length(var.private_subnets)}"
  build_flow_logs     = "false"
  cidr_range          = "${var.cidr_range}"
  custom_tags         = "${local.tags}"
  environment         = "${var.environment}"
  private_cidr_ranges = "${var.private_subnets}"
  public_cidr_ranges  = "${var.public_subnets}"
  vpc_name            = "${var.vpc_name}"
}
