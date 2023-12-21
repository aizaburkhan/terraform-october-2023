resource "aws_security_group" "new" {
    
}

import {
  to = aws_security_group.new
  id = "sg-04d06ab8e09b355eb"
  
}

#terraform import aws_security_group.new sg-04d06ab8e09b355eb