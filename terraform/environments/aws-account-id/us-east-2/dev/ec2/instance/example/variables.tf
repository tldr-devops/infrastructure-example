variable "terraform_key_pair_id" {
  description = "Terraform key_pair id"
  type        = string
}

variable "terraform_key_pair_private_key_openssh" {
  description = "Terraform key_pair private_key_openssh"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the default vpc subnet in a region"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of IDs of security groups for attaching into instance"
  type        = list
  default     = []
}
