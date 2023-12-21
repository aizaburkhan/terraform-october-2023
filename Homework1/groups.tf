resource "aws_iam_group" "devengineers" {
  name = "devops"
}

resource "aws_iam_group" "testers" {
  name = "qa"
}

resource "aws_iam_user_group_membership" "example1" {
  user = aws_iam_user.lb1.name

  groups = [
    aws_iam_group.devengineers.name
  ]
}
resource "aws_iam_user_group_membership" "example2" {
   user = aws_iam_user.lb2.name

  groups = [
    aws_iam_group.devengineers.name,
  ]
}

resource "aws_iam_user_group_membership" "example3" {
  user = aws_iam_user.lb3.name

  groups = [
    aws_iam_group.testers.name,
  ]
}

resource "aws_iam_user_group_membership" "example4" {
  user = aws_iam_user.lb4.name

  groups = [
    aws_iam_group.testers.name,
  ]
}


