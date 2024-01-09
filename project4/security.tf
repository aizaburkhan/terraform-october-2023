resource "aws_security_group" "project_sg" {
  name        = "group-4"
  description = "Allow TLS/SSL inbound traffic"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "Group-4"
  }
  #otherwise it will use the default vpc

  ingress { #inbound rules
    description = "Allow SSH Traffic"
    from_port   = 22 #ssh
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"] #set of strings in HCL
  }

  ingress { #inbound rules
    description = "Allow HTTPS Traffic"
    from_port   = 443
    to_port     = 443 #https
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress { #inbound rules
    description = "Allow HTTP Traffic"
    from_port   = 80
    to_port     = 80 #https
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress { #inbound rules for Jenkins 
    description = "Allow 8080 Traffic"
    from_port   = 8080
    to_port     = 8080 #jenkins
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress { #outbound rules
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}