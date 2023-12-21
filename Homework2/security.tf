resource "aws_security_group" "homework_sg" {
  name        = "homework_sg"
  description = "Allow TLS/SSL inbound traffic"
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

 ingress { #inbound rules
    description      = "TLS/SSL from VPC"
    from_port        = 443
    to_port          = 443 #https
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #set of strings in HCL
  }

 ingress { #inbound rules
    description      = "TLS/SSl from VPC"
    from_port        = 3306
    to_port          = 3306 #mysql-aurora
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

   tags = local.common_tags
}