
resource "aws_iam_group" "Group1" {
  name = var.Group_Name
  path = "/"
}


resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.Group1.name
  policy_arn = aws_iam_policy.policy1.arn
}