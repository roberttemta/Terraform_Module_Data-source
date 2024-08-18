
resource "aws_instance" "name" {
  provider      = aws.us1
  ami           = "ami-03972092c42e8c0ca"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.aws_key.key_name

  depends_on = [aws_key_pair.aws_key]

}

resource "null_resource" "n1" {

connection {
      type        = "ssh"
      port        = 22
      user        = "ec2-user"
      host        = aws_instance.name.public_ip            
      private_key = file(local_file.ssh_key.filename)
    }


  # The command on this code will run local on your laptop
  provisioner "local-exec" {
    command = "touch install.sh"
  }


  provisioner "remote-exec" {
    inline = [  
        "touch inventory.sh",
        
     ]
    
  }


  provisioner "file" {
    destination = "/tmp/install.sh"
    source      = "install.sh"
  }

  depends_on = [aws_instance.name]

}

