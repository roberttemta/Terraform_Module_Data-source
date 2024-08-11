
output "IAM-Group-Name" {
  value = aws_iam_group.Group1.name
}

output "ARN" {
  value = aws_iam_group.Group1.arn
}