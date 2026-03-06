output "poweruser_role_arn" {
  description = "ARN of the PowerUser IAM role"
  value       = module.global_iam.poweruser_role_arn
}

output "readonly_role_arn" {
  description = "ARN of the ReadOnly IAM role"
  value       = module.global_iam.readonly_role_arn
}

output "instance_profile_role_arn" {
  description = "ARN of the Instance Profile IAM role"
  value       = module.global_iam.instance_profile_arn
}

output "terraform_role_arn" {
  description = "ARN of the Role for PS TF Configuration"
  value       = module.global_iam.terraform_role_arn
}