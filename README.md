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
* [How to Build an End to End Production-Grade Architecture on AWS](https://blog.gruntwork.io/how-to-build-an-end-to-end-production-grade-architecture-on-aws-part-1-eae8eeb41fec#eb3a)
* [A Comprehensive Guide to Terraform](https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca#.b6sun4nkn)
* [How to manage Terraform state](https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa#.r6xdvtxqe)
* [Terragrunt: how to keep your Terraform code DRY and maintainable](https://blog.gruntwork.io/terragrunt-how-to-keep-your-terraform-code-dry-and-maintainable-f61ae06959d8)
* [Automate Terraform with GitHub Actions](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions)
* [Terraform up and running](https://github.com/brikis98/terraform-up-and-running-code/)
* [How to create reusable infrastructure with Terraform modules](https://blog.gruntwork.io/how-to-create-reusable-infrastructure-with-terraform-modules-25526d65f73d)
* [How to use Terraform as a team](https://blog.gruntwork.io/how-to-use-terraform-as-a-team-251bc1104973)
* [A comprehensive guide to managing secrets in your Terraform code](https://blog.gruntwork.io/a-comprehensive-guide-to-managing-secrets-in-your-terraform-code-1d586955ace1)
* [5 Lessons Learned From Writing Over 300,000 Lines of Infrastructure Code](https://blog.gruntwork.io/5-lessons-learned-from-writing-over-300-000-lines-of-infrastructure-code-36ba7fadeac1)