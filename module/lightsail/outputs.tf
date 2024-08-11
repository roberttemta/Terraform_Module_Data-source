/*
output "ssh_command" {
    value = "ssh -i "

}
*/ 

output "Public_Ip" {
  value = aws_lightsail_instance.server.public_ip_address
}