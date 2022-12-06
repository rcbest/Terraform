provider "aws" {
  region = "eu-central-1"
}
resource "aws_instance" "tr-ubuntu" {
  count = 2
    ami = "ami-076309742d466ad69"
    instance_type = "t2.micro"
}