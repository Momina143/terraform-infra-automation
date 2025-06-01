output "Lab2_EC2_Public_IP" {
  value = aws_instance.Lab2_Instance.public_ip
}

output "Lab2_S3_Bucket_Name" {
  value = aws_s3_bucket.Lab2_Bucket.bucket
}

