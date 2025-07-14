provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.1"
    }
  }
backend "s3" {
  bucket         = "tf-remote-state-bucket-momina"
  key            = "terraform.tfstate"
  region         = "us-east-1"
  dynamodb_table = "tf-s3-app-lock"
  encrypt        = true
  }
}

locals {
  mytag = "data_source_lab"
}

data "aws_ami" "tf_ami" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

variable "ec2_type" {
  default = "t2.micro"
}

resource "aws_instance" "tf-ec2" {
  ami           = data.aws_ami.tf_ami.id
  instance_type = var.ec2_type
  key_name      = "aws-key1"
  tags = {
    Name = "${local.mytag}-this is from my-ami"
  }
}