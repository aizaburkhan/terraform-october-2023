data "aws_ami" "ubuntu" {
  most_recent = true
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
  subnet_id= aws_subnet.main1.id
  vpc_security_group_ids = [aws_security_group.homework_sg.id] # add up to 5 sgs possible
  key_name = aws_key_pair.parent.key_name
  user_data = file("apache2.sh")
  }
output ec2 {
  value=aws_instance.web.public_ip
}
#ran the command terraform apply --auto-approve (and it will create 3 )

resource "aws_key_pair" "parent" {
  key_name   = "my-key"
  public_key = file("~/.ssh/id_rsa.pub")
}