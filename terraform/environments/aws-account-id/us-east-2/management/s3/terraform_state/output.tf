output "terraform_state_s3_bucket_name" {
  value       = aws_s3_bucket.terraform_state.id
  description = "The Name of the S3 bucket for terraform state"
}
