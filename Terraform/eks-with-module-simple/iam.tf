# # Group Users
# module "iam_group_with_policies" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
#   version = "5.1.0"

#   for_each                          = var.group_config
#   name                              = local.group_name[each.key]
#   group_users                       = local.group_users[each.key]
#   attach_iam_self_management_policy = local.attach_iam_self_management_policy[each.key]
#   custom_group_policy_arns = local.iam_read_only_policy_create_policy[each.key] ? [
#     module.iam_read_only_policy[each.key].arn,
#   module.iam_policy[each.key].arn, ] : [module.iam_policy[each.key].arn, ]

#   depends_on = [
#     module.iam_policy,
#     module.iam_read_only_policy,
#     module.iam_user
#   ]
# }



# # User module
# module "iam_user" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-user"
#   version = "5.1.0"

#   for_each                      = var.user_config
#   name                          = local.user_name[each.key]
#   force_destroy                 = local.force_destroy_user[each.key]
#   create_user                   = local.create_user[each.key]
#   create_iam_user_login_profile = false ## Managed by resource aws_iam_user_login_profile.this # local.create_iam_user_login_profile[each.key]
#   password_length               = local.password_length[each.key]
#   permissions_boundary          = local.permissions_boundary[each.key]
#   create_iam_access_key         = local.create_iam_access_key[each.key]
#   password_reset_required       = local.password_reset_required[each.key]

# }



# # Policies modules
# module "iam_read_only_policy" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-read-only-policy"
#   version = "5.1.0"

#   for_each                   = var.group_config
#   name                       = local.iam_read_only_policy_name[each.key]
#   path                       = local.iam_read_only_policy_path[each.key]
#   description                = local.iam_read_only_policy_description[each.key]
#   allowed_services           = local.iam_read_only_policy_allowed_services[each.key]
#   allow_web_console_services = local.iam_read_only_policy_allow_web_console_services[each.key]
#   create_policy              = local.iam_read_only_policy_create_policy[each.key]
#   web_console_services       = local.iam_read_only_policy_web_console_services[each.key]
# }



# module "iam_policy" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
#   version = "5.1.0"

#   for_each      = var.group_config
#   name          = local.iam_policy_name[each.key]
#   create_policy = local.iam_policy_create_policy[each.key]
#   path          = local.iam_policy_path[each.key]
#   description   = local.iam_policy_description[each.key]
#   policy        = local.iam_policy_policies[each.key]
# }

# resource "aws_iam_user_login_profile" "this" {
#   for_each                = var.user_config
#   user                    = module.iam_user[each.key].iam_user_name
#   pgp_key                 = ""
#   password_length         = local.password_length[each.key]
#   password_reset_required = local.password_reset_required[each.key]
#   depends_on = [
#     module.iam_user
#   ]
#   lifecycle {
#     ignore_changes = [
#       password_length,
#       password_reset_required,
#     ]
#   }
# }

# module "iam_eks_role" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
#   version = "5.2.0"

#   for_each = var.service_account_role

#   role_name        = local.iam_eks_role_role_name[each.key]
#   create_role      = local.iam_eks_role_create_role[each.key]
#   role_policy_arns = local.iam_eks_role_role_policy_arns[each.key]
#   oidc_providers   = local.iam_eks_role_oidc_providers[each.key]
#   tags             = local.iam_eks_role_tags[each.key]
# }