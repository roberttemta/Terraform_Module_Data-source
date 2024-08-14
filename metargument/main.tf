/*
resource "aws_instance" "server1" {
  count = 2
  ami = "ami-03972092c42e8c0ca"
  instance_type = "t2.micro"
  tags = {
    Name = "Dev-${count.index +1}"
  }

}



locals {
  env = "dev"        # You declare and use it in the same file
}

output "v" {
  value = local.env
}


resource "aws_iam_user" "user" {
  count = 5
  name = "Terraform-${count.index +1}"
}

variable "instance_type" {
    type = list(string)
  default = ["t2.micro", "t2.small", "t2.medium"]
}


resource "aws_instance" "name" {
  ami = "ami-03972092c42e8c0ca"
  for_each = toset(var.instance_type)
  instance_type = each.key


}

*/

variable "username" {
  type    = list(string)
  default = ["Ansible", "Devops", "Developer"]
}

resource "aws_iam_user" "user" {
  for_each = toset(var.username)
  name     = each.value
  #name = each.key what is the difference between
  depends_on = [ 
    aws_iam_group.group_cd,
    aws_iam_group.group_cd,
    aws_iam_group.group_cd
    
     ]
}
resource "aws_iam_group" "group_ci" {
  name = "CI"
  path = "/"
}

resource "aws_iam_group" "group_cd" {
  name = "CD"
  path = "/"
}

resource "aws_iam_group" "group_ci_cd" {
  name = "CI-CD"
  path = "/"
}


# Attaching all 3 IAM Users to each group
# I try to put each user with a structure placement without a success 

resource "aws_iam_group_membership" "group_ci_membership" {
  name  = "ci-membership"
  users =  [for user in aws_iam_user.user : user.name]
  group = aws_iam_group.group_ci.name
}

resource "aws_iam_group_membership" "group_cd_membership" {  
  name  = "cd-membership"
  users = [for user in aws_iam_user.user : user.name]
  group = aws_iam_group.group_cd.name
}

resource "aws_iam_group_membership" "group_ci_cd_membership" {
  name  = "ci-cd-membership"
  users = [for user in aws_iam_user.user :  user.name[0] ]
  group = aws_iam_group.group_ci_cd.name
}


# aws iam list-groups-for-user --user-name Thierry 
# The above command help to list all group that the IAM user Thierry belong to

