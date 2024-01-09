#manually create DynaDB table with the name "lock-state" and partition key as LockID 
terraform {
  backend "s3" {
    bucket = "s3-statefile-backends"
    key    = "virginia/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "lock-state" 
  }
}

terraform {
  backend "s3" {
    bucket = "s3-statefile-backends"
    key    = "ohio/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "lock-state"
  }
}


terraform {
  backend "s3" {
    bucket = "s3-statefile-backends"
    key    = "oregon/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "lock-state"
  }
}

terraform {
  backend "s3" {
    bucket = "s3-statefile-backends"
    key    = "california/terraform.tfstate"
    region = "us-west-1"
    dynamodb_table = "lock-state"
  }
}


