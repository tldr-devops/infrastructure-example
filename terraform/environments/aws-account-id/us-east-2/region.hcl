generate "provider_aws" {
    path      = "provider_aws.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
provider "aws" {
  region = "us-east-2"
}
EOF
}