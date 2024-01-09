provider "aws" {
  region = "us-east-2"
}

# resource "null_resource" "cluster" {
#   # Changes to any instance of the cluster requires re-provisioning
#   triggers = {
#     always_run = "${timestamp()}" #every time run? 
#   }

#   # Bootstrap script can run on any instance of the cluster
#   # So we just choose the first in this case
#   connection {
#     host = element(aws_instance.web[*].public_ip, 0)
#     type= "ssh"
#     user = "ec2-user"
#     private_key = file("~/.ssh/id_rsa") #take private key Bastion and insert to new ec2 to ssh paswordless later. 
#   }
# #ssh process to get the new ip of the ec2 and connect. 0 stands for the # of assigned ips, 0 is the start. 
#   provisioner "remote-exec" { #will run these command on the remote VM
#     # Bootstrap script called with private_ip of each node in the cluster
#     inline = [
#         "sudo yum install httpd -y", 
#         "sudo systemctl start httpd", 
#         "sudo systemctl enable httpd", 
#         "sudo yum install git -y"
#     ]
#   }
# }

