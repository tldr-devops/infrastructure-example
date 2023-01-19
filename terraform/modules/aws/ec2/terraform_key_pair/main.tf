resource "tls_private_key" "ssh_key" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "terraform_ssh_key" {
  key_name   = "terraform_${tls_private_key.ssh_key.id}"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

output "id" {
  description = "The ID of the terraform ssh key pair"
  value       = try(aws_key_pair.terraform_ssh_key.id, "")
}

output "public_key" {
  description = "The public key of the terraform ssh key pair"
  value       = try(aws_key_pair.terraform_ssh_key.public_key, "")
}

output "private_key_openssh" {
  description = "The private key of the terraform ssh key pair"
  value     = try(tls_private_key.ssh_key.private_key_openssh, "")
  sensitive = true
}