# vpc Terraform Module

Terraform Module which creates a VPC with two public subnets

## Usage

```hcl
module "vpc" {
  source            = "github.com/perios101/terraform/modules/vpc"
  region            = "eu-west-2"
  enableDnsSupport  = true
  enableDnsHostnames = true
  availabilityZones = {
    az1 = "eu-west-2a" # First availability zone for the region.
    az2 = "eu-west-2b" # Second availability zone for the region.
  }
}
```
