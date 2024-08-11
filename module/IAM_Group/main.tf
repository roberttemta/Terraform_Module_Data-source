
resource "aws_iam_group" "Group1" {
  name = var.Group_Name
  path = "/users/"
}
