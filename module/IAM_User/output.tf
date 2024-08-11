

output "IAM-USER-NAME" {
  value = aws_iam_user.User1.name
}

output "ARN" {
  value = aws_iam_user.User1.arn
}

output "Path" {
  value = aws_iam_user.User1.path
}