packer {
  required_plugins {
    amazon = {
      version = " >= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "example" {
  ami_name      = "golden image {{timestamp}}" #to show the exact time when the ec2 was created since 1970 and the name will include the ####
  instance_type = "t2.micro"
  region        = "us-east-2"
  source_ami = "ami-0cd3c7f72edd5b06d"
  ssh_username = "ec2-user"
  ssh_keypair_name = "packer" #need to have a key imported to AWS and named packer
  ssh_private_key_file = "~/.ssh/id_rsa"

  run_tags = {
    Name = "kaizen"
  }

#   ami_regions = [ #will create the ami for every regions you mention 
#     "us-east-1",
#     "us-east-2",
#     "us-west-1", 
#     "us-west-2"
#   ]
#   ami-users = [
#    "", 
#    "" #provide aws account ID # -> this way the ami will be available for certain users
#   ]
}


build {
  name    = "learn-packer"
  sources = [
    "source.amazon-ebs.example"
  ]

  provisioner "shell" { #runs the apache script 
    script = "script.sh"
  }

  provisioner "breakpoint" {
    note = "Please verify" #waits till we check if the ec2 is uo and running correct before we terminate it 
  }
}
