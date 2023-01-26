generate "backend" {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
terraform {
  backend "s3" {
    bucket = "terraform_state_bucket"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform_state"
  }
}
EOF
}