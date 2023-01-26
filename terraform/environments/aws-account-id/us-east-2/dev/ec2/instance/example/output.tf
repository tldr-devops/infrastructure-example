output "instance_ip" {
  value = aws_eip.dev_example_eip.public_ip
}