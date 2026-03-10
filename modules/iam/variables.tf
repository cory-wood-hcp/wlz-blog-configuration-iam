variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    ManagedBy   = "terraform"
    Module      = "GlobalIAMConfiguration"
  }
}

variable "aws_account_id" {
  description = "The AWS Account ID being configured "
  type        = string
}

variable "terraform_organization" {
  type = string
  default = "corydon-wood-sandbox"
}

variable "avm_project_prefix" {
    type = string
    default = "wlz-aws-"
}