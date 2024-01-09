module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = "example-asg"
  min_size                  = 2
  max_size                  = 4
  desired_capacity          = 1
  wait_for_capacity_timeout = 0 #false, means do not check 
  health_check_type         = "EC2"
  availability_zones        = ["us-east-2a", "us-east-2b", "us-east-2c"]


   # Launch template
  launch_template_name        = "example-asg"
  launch_template_description = "Launch template example"
  update_default_version      = true

  image_id          = "ami-0cd3c7f72edd5b06d"
  instance_type     = "t3.micro"
  enable_monitoring = true
}

