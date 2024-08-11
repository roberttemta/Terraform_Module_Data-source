# Generated__ by Terraform
resource "aws_instance" "web" {
  ami                                  = "ami-03972092c42e8c0ca"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1b"
  instance_type                        = "t2.medium"
  key_name                             = "virginiakey"
  security_groups                      = ["launch-wizard-4"]
  subnet_id                            = "subnet-0c5db7b69e1bd0ee5"
  tags = {
    Name = "data_souce_instance"
  }
}
