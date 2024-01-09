terraform {
  backend "s3" {
    bucket = "hello-kzn"
    key    = "ohio/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table= "lock-state"
  }
}

#must init terraform to initialize the backend and download the plugins and show where to store our tfstate file 
#this way the tfstate file is not in backend folder on local machine but uploaded as version to s3 bucket.