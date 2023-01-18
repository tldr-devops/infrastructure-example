# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "this" {
  executable_users   = var.executable_users
  most_recent        = var.most_recent
  name_regex         = var.name_regex
  owners             = var.owners
  include_deprecated = var.include_deprecated

  filter {
    name   = "name"
    values = var.filter_name
  }

  filter {
    name   = "root-device-type"
    values = var.filter_root_device_type
  }

  filter {
    name   = "virtualization-type"
    values = var.filter_virtualization_type
  }

  filter {
    name   = "architecture"
    values = var.filter_architecture
  }

  filter {
    name   = "state"
    values = var.filter_state
  }

  dynamic "filter" {
    for_each = var.filter_map
    content {
      name   = filter.value.key
      values = filter.value.value
    }
  }

}