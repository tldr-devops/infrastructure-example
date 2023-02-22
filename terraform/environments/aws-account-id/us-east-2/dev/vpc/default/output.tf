output "vpc_id" {
  value       = data.aws_vpc.default.id
  description = "The ID of the default vpc in a region"
}

output "subnet_id" {
  value       = data.aws_subnet.default.id
  description = "The ID of the default subnet in default vpc"
}

output "dev_security_group_id" {
  value       = aws_security_group.dev.id
  description = "The ID of the 'dev' security group"
}
