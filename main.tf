provider "aws" {
  region = "eu-central-1"
}
// ------------VAR---------------
variable "tr_subnet_cidr_block" {
  description = "tr_subnet_cidr_block"
  default     = "10.1.0.0/16"
  type        = string

}
variable "tr_vpc_cidr_block" {
  description = "tr_vpc_cidr_block"
  default     = "10.1.0.0/16"
  type        = string
}
variable "Name" {
  description = "Resurs_name"
  type        = list(string)

}
#   export (set) TF_VAR_avail_zone="eu-central-1b"
variable "avail_zone" {
  default = "eu-central-1c"
}
//--------------DATA--------------

data "aws_vpc" "existing_vpc" {
  default = true
}
data "aws_key_pair" "AWS_key" {
  key_name           = "AWS_key"
  include_public_key = true
}
// ---------------RESOURS---------
resource "aws_vpc" "tr_vpc" {
  cidr_block = var.tr_vpc_cidr_block
  tags = {
    "Name" = var.Name[0]
    Owner  = "Karlos"
  }
}
resource "aws_subnet" "tr_subnet" {
  vpc_id            = aws_vpc.tr_vpc.id
  cidr_block        = var.tr_subnet_cidr_block
  availability_zone = var.avail_zone
  tags = {
    "Name"      = var.Name[1]
    "Owner"     = "Karlos"
    description = "It`s my subnet"
    vpc-env     = "prod"
  }
}

resource "aws_subnet" "tr-subnet-2" {
  vpc_id            = data.aws_vpc.existing_vpc.id
  cidr_block        = "172.31.48.0/20"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "My-default-subnet"
  }
}

//---------------OUTPUT----------------

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
output "key-fingerprint" {
  value = data.aws_key_pair.AWS_key.fingerprint
}

output "name" {
  value = data.aws_key_pair.AWS_key.key_name
}

output "id" {
  value = data.aws_key_pair.AWS_key.id
}

