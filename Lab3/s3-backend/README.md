# Terraform S3 Remote State with DynamoDB Locking

This Terraform configuration sets up:

- An S3 bucket to store Terraform remote state
- Versioning on the bucket (to track changes in state)
- A DynamoDB table to manage state locking and prevent concurrent runs

---

## Resources Created

### 1. **S3 Bucket**
- Name: `tf-remote-state-bucket-momina`
- Used to store Terraform `.tfstate` files
- `force_destroy = true` is enabled (**for testing only**)

### 2. **S3 Bucket Versioning**
- Keeps version history of your state files
- Important for rollback and tracking changes

### 3. **DynamoDB Table**
- Name: `tf-s3-app-lock`
- Used for **state locking** to avoid race conditions during `apply`
- Hash key: `LockID`

---

## How to Use This Setup

1. Run `terraform init` to initialize the project
2. Run `terraform apply` to apply changes
3. Run `terraform destroy` to clean up and delete everything. 