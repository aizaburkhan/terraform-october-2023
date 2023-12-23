resource "aws_security_group" "homework_sg" {
  name        = "homework_sg"
  description = "Allow TLS/SSL inbound traffic"
  vpc_id= aws_vpc.main.id
#will use the default vpc

  ingress { #inbound rules
    description      = "TLS from VPC"
    from_port        = 22 #ssh
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #set of strings in HCL
  }

  ingress { #inbound rules
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80 #http
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #set of strings in HCL
  }

  egress { #outbound rules
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}