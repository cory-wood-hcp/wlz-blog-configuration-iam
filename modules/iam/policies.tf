# Data source for IAM policy document - PowerUser policy (Administrator access)
data "aws_iam_policy_document" "poweruser_policy" {
  statement {
    effect = "Allow"
    actions = ["*"]
    resources = ["*"]
  }
}

# Data source for IAM policy document - ReadOnly policy
data "aws_iam_policy_document" "readonly_policy" {
  statement {
    effect = "Allow"
    actions = [
      "autoscaling:Describe*",
      "cloudformation:Describe*",
      "cloudformation:List*",
      "cloudformation:Get*",
      "cloudtrail:Describe*",
      "cloudtrail:Get*",
      "cloudtrail:List*",
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*",
      "ec2:Describe*",
      "ec2:Get*",
      "elasticloadbalancing:Describe*",
      "iam:Get*",
      "iam:List*",
      "iam:Generate*",
      "logs:Describe*",
      "logs:Get*",
      "logs:List*",
      "logs:StartQuery",
      "logs:StopQuery",
      "logs:TestMetricFilter",
      "logs:FilterLogEvents",
      "rds:Describe*",
      "rds:List*",
      "route53:Get*",
      "route53:List*",
      "s3:Get*",
      "s3:List*",
      "s3:Head*",
      "sns:Get*",
      "sns:List*",
      "sqs:Get*",
      "sqs:List*",
      "sqs:Receive*",
      "ssm:Describe*",
      "ssm:Get*",
      "ssm:List*",
      "sts:Get*",
      "support:*",
      "tag:Get*",
      "trustedadvisor:Describe*"
    ]
    resources = ["*"]
  }
}

# PowerUser IAM Policy
resource "aws_iam_policy" "poweruser_policy" {
  name        = "power-user-access-policy"
  description = "PowerUser policy with administrator access"
  policy      = data.aws_iam_policy_document.poweruser_policy.json

  tags = merge(var.common_tags, {
    Name = "power-user-access-policy"
    Role = "PowerUser"
  })
}

# ReadOnly IAM Policy
resource "aws_iam_policy" "readonly_policy" {

  name        = "read-only-access-policy"
  description = "ReadOnly policy with read and list access to AWS services"
  policy      = data.aws_iam_policy_document.readonly_policy.json

  tags = merge(var.common_tags, {
    Name = "read-only-access-policy"
    Role = "ReadOnly"
  })
}

# Data source for assume role policy document (for both roles)
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:root"]
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "terraform_assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type = "Federated"
      identifiers = [aws_iam_openid_connect_provider.tfe.arn]
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "StringEquals"
      values = ["aws.workload.identity"]
      variable = "app.terraform.io:aud"
    }
    condition {
      test     = "StringLike"
      values = ["organization:${var.terraform_organization}:project:${var.avm_project_prefix}*:stack:*:*","organization:${var.terraform_organization}:project:${var.avm_project_prefix}*:workspace:*:run_phase:*"]
      variable = "app.terraform.io:sub"
    }
  }
}

# Data source for EC2 instance assume role policy document
data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}