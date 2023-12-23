variable region {
    type= string #mandatory part to specify
    description= "Provide region"
    default= "us-east-2" #if the region is not specified, the EC2 will be create din where the Bastion Host is runnigng the code
}

variable cidr_block {
    type= string 
    description= "Provide the cidr block"
    default= "10.0.0.0/16"
}

variable subnet1_cidr {
    type= string
    description=" Provide the cidr block"
    default= "10.0.1.0/24"
}

variable subnet2_cidr {
    type= string
    description=" Provide the cidr block"
    default= "10.0.2.0/24"
}

variable subnet3_cidr {
    type= string
    description=" Provide the cidr block"
    default= "10.0.3.0/24"
}

variable instance_type {
    type= string
    description=" Provide the instance type"
    default= "t2.micro"
}