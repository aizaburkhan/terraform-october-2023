```hcl

module "jenkins" {
    source = ""
    version = "0.0.1"
    region = "us-east-2"
    vpc_cidr = "10.0.0.0/16"
    vpc_name = "group4-ec2"
    subnet1_cidr_block = "10.0.1.0/24"
    subnet2_cidr_block = "10.0.2.0/24"
    subnet3_cidr_block = "10.0.3.0/24"
    instance_type = "t2.micro"
    key_name = "my-key"
    type = true
}

```
