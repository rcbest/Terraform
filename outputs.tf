output "ami-name" {
  value = data.aws_ami.latest-amazon-linux-image.id
}
output "public-ip" {
  value = aws_instance.myapp-server.public_ip
}