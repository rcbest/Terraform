provider "aws" {
 region  = "eu-central-1"
 }
variable "tr_subnet_cidr_block" {
    description = "tr_subnet_cidr_block"
    
 }
 variable "tr_vpc_cidr_block" {
    description = "tr_vpc_cidr_block"
    default = "10.1.0.0/16"
    type = string
 }
 variable "Name" {
    description = "Resurs_name"
    type = list(string)
   
 }
resource "aws_vpc" "tr_vpc" {
    cidr_block = var.tr_vpc_cidr_block
    tags = {
      "Name" = var.Name[0]
      Owner = "Karlos"
    }
} 
resource "aws_subnet" "tr_subnet" {
    vpc_id = aws_vpc.tr_vpc.id
    cidr_block = var.tr_subnet_cidr_block
    availability_zone = "eu-central-1a"
    tags = {
      "Name" = var.Name[1]
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
output "tr-vpc-id" {
    value = aws_vpc.tr_vpc.id
 }

output "tr-vpc-cidr-block" {
    value = aws_vpc.tr_vpc.cidr_block
 }

output "tr-subnet-id" {
    value = aws_subnet.tr_subnet.id
 }

output "tr-subnet-arn" {
    value = aws_subnet.tr_subnet.arn
}

output "tr-subnet-cidr_block" {
    value = aws_subnet.tr_subnet.cidr_block
}

