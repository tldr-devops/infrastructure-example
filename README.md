# Infrastructure Example
This example was conceived as an infrastructure for one AWS account with one region and division into dev, management and prod environments.
But it can be extended for multiple regions, aws accounts and other clouds.

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
- [Filipp Frizzy](https://github.com/Friz-zy/) 15.0h

## [Terraform](https://www.terraform.io/) and [Terragrunt](https://terragrunt.gruntwork.io)
In this setup I use terraform with terragrunt for provisioning whole infrastructure.
Terraform can store it's state in files or in remote backend via S3 or [Terraform Cloud](https://cloud.hashicorp.com/products/terraform).
For command work we should use only remote state. In this setup I use AWS S3 `terraform_state` bucket + DynamoDB for locking.
This require some initial preparation:
```
cd terraform/environments/aws-account-id/us-east-2/management/s3/terraform_state/
terraform init
terraform apply
sed -i "s/terraform_state_bucket/$(terraform output terraform_state_s3_bucket_name|sed 's/\"//g')/g" ../../../../backend.hcl
terragrunt init
```

## [Ansible](https://www.ansible.com/)

## Resources
