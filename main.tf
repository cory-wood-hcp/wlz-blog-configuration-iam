module "global_iam"  {
  source = "./modules/iam"
  aws_account_id = var.aws_account_id
}

