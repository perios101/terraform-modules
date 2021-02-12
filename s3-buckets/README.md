# s3-buckets Terraform Module

Terraform Module which creates two AWS S3 buckets

## Usage

```hcl
module "s3-buckets" {
  source            = "github.com/perios101/terraform-modules/s3-buckets"
  s3_bucket_names   = ["bucket1", "bucket2"]
  versioning        = true
  region            = "eu-west-2"
  accountId         = {AWS_ACCOUNT_ID}
}
```
