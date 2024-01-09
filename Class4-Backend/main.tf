provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = {
    Name = "Kaizen"
    Team = "DevOps"
  }
}

#if you wanted to revert to certain tfstate, u download from s3, copy/paste in the new tf file and initialize terraform. 
