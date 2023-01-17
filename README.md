# Infrastructure Example
This example was conceived as an infrastructure for one AWS account with one region and division into dev, management and prod environments.

Current files structure:
```
ansible/ansible.cfg
terraform/environments/aws-account-id/backend.hcl
terraform/environments/aws-account-id/global/management/.gitkeep
terraform/environments/aws-account-id/us-east-2/dev/vpc/default/main.tf
terraform/environments/aws-account-id/us-east-2/dev/vpc/default/terragrunt.hcl
terraform/environments/aws-account-id/us-east-2/management/s3/terraform_state/main.tf
terraform/environments/aws-account-id/us-east-2/management/s3/terraform_state/terragrunt.hcl
terraform/environments/aws-account-id/us-east-2/management/vpc/default/main.tf
terraform/environments/aws-account-id/us-east-2/management/vpc/default/terragrunt.hcl
terraform/environments/aws-account-id/us-east-2/prod/vpc/default/main.tf
terraform/environments/aws-account-id/us-east-2/prod/vpc/default/terragrunt.hcl
terraform/environments/aws-account-id/us-east-2/region.hcl
terraform/modules/.gitkeep
```

Time track:
- [Filipp Frizzy](https://github.com/Friz-zy/) 11.5h

## [Terraform](https://www.terraform.io/) and [Terragrunt](https://terragrunt.gruntwork.io)
In this setup I use terraform with terragrunt for provisioning whole infrastructure.

## [Ansible](https://www.ansible.com/)

## Resources
