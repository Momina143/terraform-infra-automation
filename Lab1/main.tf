terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }
}


provider "aws" {
  region = "us-east-1"
  # If running locally, you could also use:
  # access_key = "YOUR_ACCESS_KEY"
  # secret_key = "YOUR_SECRET_KEY"
  # Or use a named profile:
  # profile = "your-aws-profile"
}

resource "aws_instance" "Instance_Created_by_Terraform" {
  ami           = "ami-0953476d60561c955" 
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Lab_1_EC2_Instance"
    Environment = "Lab1"
  }
}

resource "aws_s3_bucket" "Bucket_Created_by_Terraform" {
  bucket = "terraform-lab1-bucket-by-momina"

  tags = {
    Name        = "Terraform_Lab_1_S3_Bucket"
    Environment = "Lab1"
  }
}