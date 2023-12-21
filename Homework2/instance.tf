data "aws_ami" "ubuntu" {
  most_recent = true
   #ami id = ami-07b36ea9852e986ad
   #should pick the lates one with the date: 2023/10/26 00:01 GMT-4
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  availability_zone = "us-east-2a"
  vpc_security_group_ids = [aws_security_group.homework_sg.id] # add up to 5 sgs possible
  key_name = aws_key_pair.homework_key.key_name
  user_data = file("apache2.sh")
  tags = local.common_tags
  }

#ran the command terraform apply --auto-approve (and it will create 3 )