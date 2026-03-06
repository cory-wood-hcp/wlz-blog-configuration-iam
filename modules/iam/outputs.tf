output "poweruser_role_arn" {
  description = "ARN of the PowerUser IAM role"
  value       = aws_iam_role.poweruser.arn
}

output "readonly_role_arn" {
  description = "ARN of the ReadOnly IAM role"
  value       = aws_iam_role.readonly.arn
}

output "poweruser_policy_arn" {
  description = "ARN of the PowerUser IAM policy"
  value       = aws_iam_policy.poweruser_policy.arn
}

output "readonly_policy_arn" {
  description = "ARN of the ReadOnly IAM policy"
  value       = aws_iam_policy.readonly_policy.arn
}

output "instance_profile_role_arn" {
  description = "ARN of the Instance Profile IAM role"
  value       = aws_iam_role.instance_profile.arn
}

output "instance_profile_arn" {
  description = "ARN of the EC2 Instance Profile"
  value       = aws_iam_instance_profile.instance_profile.arn
}

output "terraform_role_arn" {
  description = "ARN of the Terraform IAM role"
  value = aws_iam_role.terraform_role.arn
}