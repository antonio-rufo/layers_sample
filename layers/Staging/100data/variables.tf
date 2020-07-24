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

variable "s3_bucketname" {
  description = "The name of the S3 bucket for the access logs. The bucket name can contain only lowercase letters, numbers, periods (.), and dashes (-). Must be globally unique. If changed, forces a new resource."
  type        = "string"
}

variable "s3_bucket_acl" {
  description = "Bucket ACL. Must be either authenticated-read, aws-exec-read, bucket-owner-read, bucket-owner-full-control, log-delivery-write, private, public-read or public-read-write."
  type        = "string"
}

variable "s3_bucket_versioning" {
  description = "Enable bucket versioning. i.e. true"
  type        = "string"
}

variable "s3_bucket_encryption" {
  description = "The server-side encryption algorithm to use. Valid values are AES256, aws:kms, and none"
  type        = "string"
}
