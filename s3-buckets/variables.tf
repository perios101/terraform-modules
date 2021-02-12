variable "s3_bucket_names" {
  type        = list
  default     = ["dev-bucket", "prod-bucket"]
}

variable "versioning" {
  description = "Bucket versioning?"
  type        = bool
  default     = true
}

variable "public" {
  description = "Allow public read access to our buckets?"
  type        = bool
  default     = false
}

variable "prevent_destroy" {
  description = "Prevent destroy on our buckets?"
  type        = bool
  default     = false
}

variable "region" {
  description = "AWS Region to deploy buckets"
  default     = "eu-west-2"
}

# variable "target_bucket" {
#   type        = string
#   description = "(Required) The name of the bucket that will receive the log objects."
#   default     = ""
# }
# variable "target_prefix" {
#   description = "Specifies a key prefix for bucket log objects."
#   default     = "log/"
#   type        = string
# }

variable "accountId" {
  description = "Specifies an AWS Account ID"
  default     = ""
}