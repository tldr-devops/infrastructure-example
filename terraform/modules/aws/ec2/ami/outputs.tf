output "id" {
  description = "The ID of the AMI"
  value       = try(data.aws_ami.this.id, "")
}