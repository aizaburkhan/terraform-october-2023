data "aws_ami" "Linux" {
  most_recent = true
  owners      = ["137112412989"]
  #owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*"]
    #values = ["amzn2-ami-kernel-5.10-hvm-2.0.20231218.0-*"]
  }
  #filter {
    #name   = "architecture"
    #values = ["x86_64"]
  #}
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "jenkins" {
  ami                    = data.aws_ami.Linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.main1.id
  vpc_security_group_ids = [aws_security_group.project_sg.id] # add up to 5 sgs possible
  key_name               = aws_key_pair.key_auth.id
  #user_data              = file("jenkins_install.sh") #or use file("userdata.tpl") which serves as a template userdata file 
  root_block_device {
    volume_size = 10
  }
  tags = {
    Name = "Group-4"
  }
}
output "ec2" {
  value = aws_instance.jenkins.public_ip
}
#ran the command terraform apply --auto-approve (and it will create all)
resource "time_sleep" "wait_300_seconds" {
  create_duration = "300s"

  # depends_on = [ aws_instance.jenkins ]
}

resource "terraform_data" "copyJenkinsToNewEC2" {
  provisioner "local-exec" {
    command = "scp ${"jenkins_install.sh"} ec2-user@${aws_instance.jenkins.public_ip}:"
   }
    depends_on = [ time_sleep.wait_300_seconds ]
}

resource "terraform_data" "executeJenkinsFile" {
  provisioner "local-exec" {
    command = "ssh ec2-user@${aws_instance.jenkins.public_ip} bash jenkins_install.sh"
   }
   depends_on = [ terraform_data.copyJenkinsToNewEC2]
}