/*
data "aws_instance" "server" {
  instance_id = "id_of_the_instance"
}

 resource "aws_instance" "server1" {
   ami = data.aws_instance.server.ami
   instance_type = data.aws_instance.server.instance_type
   availability_zone = data.aws_instance.server.availability_zone
   security_groups = data.aws_instance.server.security_groups
 }
*/

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}

data "aws_ami" "AMZ_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}

resource "aws_instance" "server_amz2" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = "t2.micro"
}

resource "aws_instance" "server_Ubuntu" {
  ami           = data.aws_ami.AMZ_2.id
  instance_type = "t2.micro"
}