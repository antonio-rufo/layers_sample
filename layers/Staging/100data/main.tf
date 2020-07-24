/**
 * # 100data
 */

provider "aws" {
  version             = "~> 2.17"
  region              = "${var.region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

provider "random" {
  version = "~> 2.1.1"
}

provider "template" {
  version = "~> 2.1.1"
}

provider "tls" {
  version = "~> 2.1.1"
}

# remote state - take output from _main
terraform {
  version = "0.11.14"

  backend "s3" {
    # this key must be unique for each layer!
    key     = "terraform.100data.tfstate"
    bucket  = "162198556136-build-state-bucket-layers-sample"
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

data "terraform_remote_state" "000base" {
  backend = "s3"

  config = {
    key    = "terraform.000base.tfstate"
    bucket = "162198556136-build-state-bucket-layers-sample"
    region = "ap-southeast-2"
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

### S3 Bucket - vt.g2.exports ###

module "s3" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-s3//?ref=v0.0.4"

  bucket_name   = "${var.s3_bucketname}"
  bucket_acl    = "${var.s3_bucket_acl}"
  versioning    = "${var.s3_bucket_versioning}"
  environment   = "${var.environment}"
  sse_algorithm = "${var.s3_bucket_encryption}"
  bucket_tags   = "${local.tags}"
}
