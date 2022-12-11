provider "aws" {
 region  = "eu-central-1"
 }
resource "aws_vpc" "tr-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "tr-vpc"
      Owner = "Karlos"
    }
} 
resource "aws_subnet" "tr-subnet" {
    vpc_id = aws_vpc.tr-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "eu-central-1a"
    tags = {
      "Name" = "tr-subnet"
      "Owner" = "Karlos"
      description = "It`s my subnet"
      vpc-env = "prod"
    }
}
data "aws_vpc" "existing_vpc" {
    default = true
    }

resource "aws_subnet" "tr-subnet-2" {
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block = "172.31.48.0/20"
    availability_zone = "eu-central-1a"
    tags = {
      Name = "My-default-subnet"
    }
}

