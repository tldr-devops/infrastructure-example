include "backend" {
  path = find_in_parent_folders("backend.hcl")
}

include "region" {
  path = find_in_parent_folders("region.hcl")
}

dependency "terraform_key_pair" {
  config_path = "../../../../management/ec2/key_pair/terraform"

  # Configure mock outputs for the `validate` command that are returned when there are no outputs available (e.g the
  # module hasn't been applied yet.
  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    terraform_key_pair_id = "fake-key-id"
    terraform_key_pair_private_key_openssh = "fake-private_key-id"
  }
}

dependency "default_vpc" {
  config_path = "../../../vpc/default"

  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    vpc_id = "default_vpc_id"
    subnet_id = "default_subnet_id"
    dev_security_group_name = "dev"
  }
}

inputs = {
  terraform_key_pair_id = dependency.terraform_key_pair.outputs.id
  terraform_key_pair_private_key_openssh = dependency.terraform_key_pair.outputs.private_key_openssh
  security_groups = [dependency.default_vpc.outputs.dev_security_group_name]
  subnet_id = dependency.default_vpc.outputs.subnet_id
}
