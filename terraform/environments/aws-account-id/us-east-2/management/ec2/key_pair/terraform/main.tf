provider "aws" {
  region = "us-east-2"
}

module "terraform_key_pair" {
    source  = "../../../../../../../modules/aws/ec2/terraform_key_pair"
}

output "id" {
  description = "The ID of the terraform ssh key pair"
  value       = try(module.terraform_key_pair.id, "")
}

output "public_key" {
  description = "The public key of the terraform ssh key pair"
  value       = try(module.terraform_key_pair.public_key, "")
}

output "private_key_openssh" {
  description = "The private key of the terraform ssh key pair"
  value       = try(module.terraform_key_pair.private_key_openssh, "")
  sensitive = true
}