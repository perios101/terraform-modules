resource "aws_s3_bucket" "this" {
    count   = length(var.bucket_names)
    bucket  = var.s3_bucket_names[count.index]
    acl     = var.public ? "public-read" : "private"
    region  = var.region
 
    versioning {
      enabled = var.versioning
    }
 
    lifecycle {
      prevent_destroy = var.prevent_destroy
    }

    # logging {
    #   target_bucket = var.target_bucket
    #   target_prefix = var.target_prefix
    # }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                kms_master_key_id = aws_kms_key.encryptionKey.arn
                sse_algorithm     = "aws:kms"
            }
        }
    }
    
    tags = {
      Environment = terraform.workspace
      Name        = "${var.s3_bucket_names[count.index]}-${terraform.workspace}"
    }
}

resource "aws_kms_key" "encryptionKey" {
  description             = "Encryption key for S3 buckets"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  policy = <<EOF
{
  "Version" : "2012-10-17",
  "Statement" : [ {
      "Sid" : "Enable IAM User Permissions",
      "Effect" : "Allow",
      "Principal" : {
        "AWS" : "arn:aws:iam::${var.accountId}:root"
      },
      "Action" : "kms:*",
      "Resource" : "*"
    },
    {
      "Effect": "Allow",
      "Principal": { "Service": "logs.${var.awsRegion}.amazonaws.com" },
      "Action": [ 
        "kms:Encrypt*",
        "kms:Decrypt*",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:Describe*"
      ],
      "Resource": "*"
    }  
  ]
}
EOF


  tags = {
    Environment = terraform.workspace
    Name  = "s3-buckets-kms-key-${terraform.workspace}"
  }
}