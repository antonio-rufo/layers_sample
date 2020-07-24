output "bucket_id" {
  description = "The name of the bucket."
  value       = "${module.s3.bucket_id}"
}

output "bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = "${module.s3.bucket_arn}"
}
