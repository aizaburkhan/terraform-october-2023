resource "aws_key_pair" "parent" {
  key_name   = "my-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

output "key_type_info" {
  value=aws_key_pair.parent.key_type
}