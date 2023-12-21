resource "aws_instance" "new" {

}

import {
  to = aws_instance.new
  id = "i-0ee2bf0ec3583b879"
}
#terraform import aws_instance.new i-0ee2bf0ec3583b879