output "aws_instance" {
  value = aws_instance.myapp-server.public_ip
}
output "ami-name" {
  value = data.aws_ami.latest-amazon-linux-image.id
}