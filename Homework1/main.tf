resource "aws_iam_user" "lb1" {
  name = "Aizada"
  }

resource "aws_iam_user" "lb2" {
  name = "Kaizen"
}

output "aizada_user_full_output" {
  value = aws_iam_user.lb1

}

output "kaizen_user_unique_id" {
  value = aws_iam_user.lb2.unique_id
}

resource "aws_iam_user" "lb3" {
  name = "Hello"
  }

resource "aws_iam_user" "lb4" {
  name = "World"
  }