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
*/

variable "username" {
  type = list(string)
  default = [ "Ansible", "Devops", "Developer" ]
}

resource "aws_iam_user" "user1" {
  for_each = toset(var.username)
  name = each.key
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