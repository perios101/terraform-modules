variable "region" {
  description = "AWS Region to deploy VPC resources"
  type        = string
  default     = "eu-west-2"
}

variable "availabilityZones" {
  type        = map(string)
  default     = {
    az1 = "${var.region}a"
    az2 = "${var.region}b"
  }
}

variable "enableDnsHostnames" {
  type        = bool
  description = "Enable DNS hostnames in the VPC?"
  default     = true
}

variable "enableDnsSupport" {
  type        = bool
  description = "Enable DNS support in the VPC?"
  default     = true
}

variable "enable_sg_custom" {
  type        = bool
  description = "Enable custom Security Group for the VPC?"
  default     = false
}