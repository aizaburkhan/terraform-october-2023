resource "aws_s3_bucket" "oh" {

}
#before import code and running the import command, please make sure to set the bucket configuration and define the resource types like above

import {
  to = aws_s3_bucket.oh
  id = "ohbucketmine1"
}

#run this command: terraform import aws_s3_bucket.oh ohbucketmine1

resource "aws_s3_bucket" "oh2" {

}

import {
  to = aws_s3_bucket.oh2
  id = "ohbucketmine2"
}

#terraform import aws_s3_bucket.oh2 ohbucketmine2