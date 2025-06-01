terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Lab2_Instance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  # key_name      = "my-key-pair" #Not using a keypair for this / using an IAM role instead for security reasons
  tags = {
    Name = "${var.ec2_name}-instance"
  }
}

resource "aws_s3_bucket" "Lab2_Bucket" {
  bucket = var.aws_s3_bucket_name
  tags = {
    Name = "${local.mytag}"
  }
}

locals {
  mytag = "momina-local-tag-for-bucket"
}




