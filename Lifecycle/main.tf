
resource "aws_instance" "name" {
  //ami = "ami-03972092c42e8c0ca" # Amazon 2 ami
  ami = "ami-0223f4f3ce8c23466"  # My personnal Jenkins ami
  instance_type = "t2.micro"
  lifecycle {
    create_before_destroy = true
    
  }

}

/*
resource "aws_iam_user" "user1" {
  name = "Dev-2024"
  lifecycle {
    prevent_destroy = false
  }
}
*/


# If you want to destroy all your resources except one, use these commands

## terraform state list 
### terraform state rm <name_of_the_ressource>
#### terraform destroy