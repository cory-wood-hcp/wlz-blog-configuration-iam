# plz-blog-configuration-iam

Terraform configuration for the blog IAM baseline, delegating most resources to the global IAM module.

## Usage

```hcl
module "global_iam" {
  source         = "./modules/iam"
  aws_account_id = var.aws_account_id
}
```

## Notes
- The AWS provider assumes `OrganizationAccountAccessRole` in `us-east-1`.
- Set `aws_account_id` to the target account ID.

<!-- BEGIN_TF_DOCS -->


## Usage

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_global_iam"></a> [global\_iam](#module\_global\_iam) | ./modules/iam | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_profile_role_arn"></a> [instance\_profile\_role\_arn](#output\_instance\_profile\_role\_arn) | ARN of the Instance Profile IAM role |
| <a name="output_poweruser_role_arn"></a> [poweruser\_role\_arn](#output\_poweruser\_role\_arn) | ARN of the PowerUser IAM role |
| <a name="output_readonly_role_arn"></a> [readonly\_role\_arn](#output\_readonly\_role\_arn) | ARN of the ReadOnly IAM role |
| <a name="output_terraform_role_arn"></a> [terraform\_role\_arn](#output\_terraform\_role\_arn) | ARN of the Role for PS TF Configuration |
<!-- END_TF_DOCS -->
