resource "aws_vpc" "vpc" {
  cidr_block           = var.vpcCidr
  enable_dns_hostnames = var.enableDnsHostnames
  enable_dns_support   = var.enableDnsSupport

  tags = {
    Environment = terraform.workspace
    Name        = "vpc-${terraform.workspace}"
  }
}

resource "aws_default_security_group" "default" {
  count   = var.enable_sg_custom ? 1 : 0
  vpc_id  = aws_vpc.vpc.id

  tags = {
    Environment = terraform.workspace
    Name        = "vpc-sg-${terraform.workspace}"
  }
}

resource "aws_internet_gateway" "vpcIgw" {
  vpc_id  = aws_vpc.vpc.id

  tags = {
    Environment = terraform.workspace
    Name        = "vpc-ig-${terraform.workspace}"
  }
}

resource "aws_default_route_table" "vpcDefaultRouteTable" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpcIgw.id
  }

  tags = {
    Environment = terraform.workspace
    Name        = "vpc-routetable-${terraform.workspace}"
  }
}

resource "aws_subnet" "vpcPublicSubnet" {
  availability_zone       = var.availabilityZones["az2"]
  cidr_block              = var.subnetCidrs
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.vpc.id

  tags = {
    Environment = terraform.workspace
    Name        = "vpc-subnet-${terraform.workspace}-public"
  }
}

resource "aws_subnet" "vpcPublicSubnet2" {
  availability_zone       = var.availabilityZones["az1"]
  cidr_block              = var.subnetCidrs2
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.vpc.id

  tags = {
    Environment = terraform.workspace
    Name        = "vpc-subnet-${terraform.workspace}-public2"
  }
}