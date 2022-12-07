provider "aws" {
  region = "eu-central-1"
}
resource "aws_instance" "tr-ubuntu" {
  count = 1
  ami = "ami-076309742d466ad69"
  instance_type = "t2.nano"
  tags = {
    Name = "Karlos1"
  }
}
resource "aws_instance" "tr-aws-linux" {
  count = 1
  ami = "ami-076309742d466ad69"
  instance_type = "t2.nano"
  tags = {
    Name = "Karlos2"
    Owner = "Karlos Shakal"
    Project = "Karlos forever"
  }
}