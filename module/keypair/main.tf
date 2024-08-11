

resource "tls_private_key" "keypair" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create the Key Pair in aws
resource "aws_key_pair" "aws_key" {
  key_name   = var.key_name
  public_key = tls_private_key.keypair.public_key_openssh
}
# Save file
resource "local_file" "ssh_key" {
  filename = var.key_pair_filename
  content  = tls_private_key.keypair.private_key_pem
}