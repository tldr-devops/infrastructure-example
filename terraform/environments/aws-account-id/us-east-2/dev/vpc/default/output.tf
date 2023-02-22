output "vpc_id" {
  value       = data.aws_vpc.default.id
  description = "The ID of the default vpc in a region"
}

output "subnet_id" {
  value       = data.aws_subnet.default.id
  description = "The ID of the default subnet in default vpc"
}

output "dev_security_group_name" {
  value       = aws_security_group.dev.name
  description = "The name of the 'dev' security group"
}
