variable "terraform_key_pair_id" {
  description = "Terraform key_pair id"
  type        = string
}

variable "terraform_key_pair_private_key_openssh" {
  description = "Terraform key_pair private_key_openssh"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the default vpc in a region"
  type        = string
}