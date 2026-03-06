# IAM Module

Creates IAM roles, policies, an instance profile, and the Terraform Cloud OIDC provider used by the blog platform.

## Usage

```hcl
module "global_iam" {
  source         = "./modules/iam"
  aws_account_id = var.aws_account_id
}
```

## Notes
- `terraform_organization` and `avm_project_prefix` scope the Terraform Cloud OIDC subject.
- `common_tags` are merged onto all taggable resources.

<!-- BEGIN_TF_DOCS -->


## Usage

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_openid_connect_provider.tfe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.poweruser_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.readonly_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.poweruser](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.terraform_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.instance_profile_cloudwatch_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.instance_profile_ssm_managed_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.poweruser_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.readonly_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.terraform_role_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ec2_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.poweruser_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.readonly_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.terraform_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_avm_project_prefix"></a> [avm\_project\_prefix](#input\_avm\_project\_prefix) | n/a | `string` | `"avm-"` | no |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | The AWS Account ID being configured | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to apply to all resources | `map(string)` | <pre>{<br/>  "ManagedBy": "terraform",<br/>  "Module": "GlobalIAMConfiguration"<br/>}</pre> | no |
| <a name="input_terraform_organization"></a> [terraform\_organization](#input\_terraform\_organization) | n/a | `string` | `"corydon-wood-sandbox"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_profile_arn"></a> [instance\_profile\_arn](#output\_instance\_profile\_arn) | ARN of the EC2 Instance Profile |
| <a name="output_instance_profile_role_arn"></a> [instance\_profile\_role\_arn](#output\_instance\_profile\_role\_arn) | ARN of the Instance Profile IAM role |
| <a name="output_poweruser_policy_arn"></a> [poweruser\_policy\_arn](#output\_poweruser\_policy\_arn) | ARN of the PowerUser IAM policy |
| <a name="output_poweruser_role_arn"></a> [poweruser\_role\_arn](#output\_poweruser\_role\_arn) | ARN of the PowerUser IAM role |
| <a name="output_readonly_policy_arn"></a> [readonly\_policy\_arn](#output\_readonly\_policy\_arn) | ARN of the ReadOnly IAM policy |
| <a name="output_readonly_role_arn"></a> [readonly\_role\_arn](#output\_readonly\_role\_arn) | ARN of the ReadOnly IAM role |
| <a name="output_terraform_role_arn"></a> [terraform\_role\_arn](#output\_terraform\_role\_arn) | ARN of the Terraform IAM role |
<!-- END_TF_DOCS -->
