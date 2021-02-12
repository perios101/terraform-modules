output "bucketArns" {
  description = "List of our bucket ARNs"
  value       = aws_s3_bucket.this.*.arn
}

output "bucketIds" {
  description = "List of our bucket IDs/names"
  value       = aws_s3_bucket.this.*.id
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.vpcIgw.*.id
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.*.id
}

output "subnet_id" {
  description = "VPC Public Subnet ID"
  value       = aws_subnet.vpcPublicSubnet.*.id
}

output "subnet_id2" {
  description = "VPC Public Subnet 2 ID"
  value       = aws_subnet.vpcPublicSubnet2.*.id
}