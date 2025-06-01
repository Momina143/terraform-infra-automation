terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

variable "num_of_buckets" {
  default = 2
}

variable "s3_bucket" {
    default = "momina-count-bucket"
}

#The resource block below creates multiple S3 buckets based on the count variable and then we comment it out to use the conditional expression instead.
resource "aws_s3_bucket" "tf-s3" {
  #count = var.num_of_buckets
  count = var.num_of_buckets != 0 ? var.num_of_buckets : 3
  bucket = "${var.s3_bucket}-${count.index}"
}

variable "users" {
  default = ["Mike", "John", "Sarah"] 
}
# The resource block below creates multiple IAM users based on the users variable and uses a for_each loop to iterate over the list of users.
resource "aws_iam_user" "users" {
  for_each = toset(var.users)
  name    = each.value
}




