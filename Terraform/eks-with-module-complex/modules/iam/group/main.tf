# Group Users
module "iam_group_with_policies" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.1.0"

  name                              = var.name
  group_users                       = var.group_users
  attach_iam_self_management_policy = var.attach_iam_self_management_policy
  custom_group_policy_arns = var.iam_read_only_policy_create_policy ? [
    module.iam_read_only_policy.arn,
  module.iam_policy.arn, ] : [module.iam_policy.arn, ]

  depends_on = [
    module.iam_policy,
    module.iam_read_only_policy,
  ]
}



# Policies modules
module "iam_read_only_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-read-only-policy"
  version = "5.1.0"

  name                       = var.iam_read_only_policy_name
  path                       = var.iam_read_only_policy_path
  description                = var.iam_read_only_policy_description
  allowed_services           = var.iam_read_only_policy_allowed_services
  allow_web_console_services = var.iam_read_only_policy_allow_web_console_services
  create_policy              = var.iam_read_only_policy_create_policy
  web_console_services       = var.iam_read_only_policy_web_console_services
}



module "iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.1.0"

  name          = var.iam_policy_name
  create_policy = var.iam_policy_create_policy
  path          = var.iam_policy_path
  description   = var.iam_policy_description
  policy        = var.iam_policy_policy
}