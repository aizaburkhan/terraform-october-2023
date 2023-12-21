data "aws_ami" "amazon" {
  most_recent = true
  owners = ["amazon"] 
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  } 
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon.id
  instance_type = "t2.micro"
  availability_zone = "us-east-2a"
  vpc_security_group_ids = [aws_security_group.homework_sg.id] # add up to 5 sgs possible
  key_name = aws_key_pair.homework_key.key_name
  user_data = file("apache.sh")
  tags = local.common_tags
  }

#ran the command terraform apply --auto-approve (and it will create 3 )