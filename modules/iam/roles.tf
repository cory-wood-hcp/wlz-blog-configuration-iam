resource "aws_iam_role" "terraform_role" {
  name = "PltaformServicesTerraformRole"
  assume_role_policy = data.aws_iam_policy_document.terraform_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "terraform_role_attachment" {
  role       = aws_iam_role.terraform_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Instance Profile IAM Role for SSM management
resource "aws_iam_role" "instance_profile" {
  name               = "ec2-ssm-instance-profile"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json
  description        = "Instance profile role for EC2 instances with SSM access"

  tags = merge(var.common_tags, {
    Name = "ec2-ssm-instance-profile"
    Role = "InstanceProfile"
  })
}

# Create instance profile
resource "aws_iam_instance_profile" "instance_profile" {
  name = "ec2-ssm-instance-profile"
  role = aws_iam_role.instance_profile.name

  tags = merge(var.common_tags, {
    Name = "ec2-ssm-instance-profile"
    Role = "InstanceProfile"
  })
}

# Attach AWS managed SSM policy to instance profile role
resource "aws_iam_role_policy_attachment" "instance_profile_ssm_managed_instance" {
  role       = aws_iam_role.instance_profile.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Attach AWS managed CloudWatch agent policy to instance profile role
resource "aws_iam_role_policy_attachment" "instance_profile_cloudwatch_agent" {
  role       = aws_iam_role.instance_profile.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

# PowerUser IAM Role
resource "aws_iam_role" "poweruser" {
  name               = "power-user-access"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  description        = "PowerUser role with administrator access"

  tags = merge(var.common_tags, {
    Name = "power-user-access"
    Role = "PowerUser"
  })
}

# Attach PowerUser policy to PowerUser role
resource "aws_iam_role_policy_attachment" "poweruser_policy_attachment" {
  role       = aws_iam_role.poweruser.name
  policy_arn = aws_iam_policy.poweruser_policy.arn
}

# ReadOnly IAM Role
resource "aws_iam_role" "readonly" {
  name               = "read-only-access"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  description        = "ReadOnly role with read and list access to AWS services"

  tags = merge(var.common_tags, {
    Name = "read-only-access"
    Role = "ReadOnly"
  })
}

# Attach ReadOnly policy to ReadOnly role
resource "aws_iam_role_policy_attachment" "readonly_policy_attachment" {
  role       = aws_iam_role.readonly.name
  policy_arn = aws_iam_policy.readonly_policy.arn
}