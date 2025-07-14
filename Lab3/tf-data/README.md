# Terraform EC2 Instance with Data Source (AMI)

This Terraform configuration sets up an EC2 instance in AWS using the most recent Amazon Machine Image (AMI) owned by your account. It also uses a remote backend to store Terraform state securely in S3 with state locking via DynamoDB.

---

## What This Code Does

- Uses the AWS provider in the `us-east-1` region (version `5.72.1`)
- Stores Terraform state in an S3 bucket with DynamoDB locking
- Fetches the most recent AMI owned by your account (with HVM virtualization)
- Creates a `t2.micro` EC2 instance using that AMI
- Adds a name tag using a `local` variable

---

## Required Setup

- S3 bucket: `tf-remote-state-bucket-momina`
- DynamoDB table: `tf-s3-app-lock`
- A valid EC2 key pair (update the `key_name` value)
- At least one AMI in your AWS account

## Notes

- Change the `key_name` to match a valid AWS key pair in your region.