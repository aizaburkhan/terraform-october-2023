resource "aws_key_pair" "homework_key" {
  key_name   = "my-key"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = local.common_tags
}