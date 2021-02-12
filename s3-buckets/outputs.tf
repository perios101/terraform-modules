output "bucketArns" {
  description = "List of our bucket ARNs"
  value       = "${aws_s3_bucket.this.*.arn}"
}

output "bucketIds" {
  description = "List of our bucket IDs/names"
  value       = "${aws_s3_bucket.this.*.id}"
}