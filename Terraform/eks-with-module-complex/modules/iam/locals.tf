# locals {
#   group_name = {
#     for k, v in var.group_config :
#     k => lookup(v, "group_name", "developers")
#   }

#   group_users = {
#     for k, v in var.group_config :
#     k => lookup(v, "group_users", "developer")
#   }

#   attach_iam_self_management_policy = {
#     for k, v in var.group_config :
#     k => lookup(v, "attach_iam_self_management_policy", true)
#   }

#   iam_read_only_policy_name = {
#     for k, v in var.group_config :
#     k => lookup(v.iam_read_only_policy, "name", "ReadOnlyDeveloper")
#   }

#   iam_read_only_policy_create_policy = {
#     for k, v in var.group_config :
#     k => lookup(v.iam_read_only_policy, "create_policy", false)
#   }

#   iam_read_only_policy_path = {
#     for k, v in var.group_config :
#     k => lookup(v.iam_read_only_policy, "path", "/")
#   }

#   iam_read_only_policy_description = {
#     for k, v in var.group_config :
#     k => lookup(v.iam_read_only_policy, "description", "")
#   }

#   iam_read_only_policy_allow_web_console_services = {
#     for k, v in var.group_config :
#     k => lookup(v.iam_read_only_policy, "allow_web_console_services", true)
#   }

#   iam_read_only_policy_allowed_services = {
#     for k, v in var.group_config :
#     k => lookup(v.iam_read_only_policy, "allowed_services", ["*"])
#   }

#   iam_read_only_policy_web_console_services = {
#     for k, v in var.group_config :
#     k => lookup(v.iam_read_only_policy, "web_console_services", ["resource-groups", "tag", "health", "ce"])
#   }

#   iam_policy_name = {
#     for k, v in var.group_config :
#     k => lookup(v.iam_policy, "name", "AllowCRUDDeveloper")
#   }

#   iam_policy_create_policy = {
#     for k, v in var.group_config :
#     k => lookup(v.iam_policy, "create_policy", false)
#   }

#   iam_policy_path = {
#     for k, v in var.group_config :
#     k => lookup(v.iam_policy, "path", "/")
#   }

#   iam_policy_description = {
#     for k, v in var.group_config :
#     k => lookup(v.iam_policy, "description", "")
#   }

#   iam_policy_policies = {
#     for k, v in var.group_config :
#     k => lookup(v.iam_policy, "policies", "")
#   }

#   user_name = {
#     for k, v in var.user_config :
#     k => lookup(v, "name", "")
#   }

#   create_user = {
#     for k, v in var.user_config :
#     k => lookup(v, "create_user", false)
#   }

#   force_destroy_user = {
#     for k, v in var.user_config :
#     k => lookup(v, "force_destroy", true)
#   }

#   create_iam_access_key = {
#     for k, v in var.user_config :
#     k => lookup(v, "create_iam_access_key", false)
#   }

#   create_iam_user_login_profile = {
#     for k, v in var.user_config :
#     k => lookup(v, "create_iam_user_login_profile", false)
#   }

#   password_length = {
#     for k, v in var.user_config :
#     k => lookup(v, "password_length", 20)
#   }

#   permissions_boundary = {
#     for k, v in var.user_config :
#     k => lookup(v, "permissions_boundary", "")
#   }

#   password_reset_required = {
#     for k, v in var.user_config :
#     k => lookup(v, "password_reset_required", false)
#   }

#   iam_eks_role_role_name = {
#     for k, v in var.service_account_role :
#     k => lookup(v, "role_name", "role")
#   }

#   iam_eks_role_create_role = {
#     for k, v in var.service_account_role :
#     k => lookup(v, "create_role", false)
#   }

#   iam_eks_role_role_policy_arns = {
#     for k, v in var.service_account_role :
#     k => lookup(v, "role_policy_arns", "")
#   }

#   iam_eks_role_oidc_providers = {
#     for k, v in var.service_account_role :
#     k => lookup(v, "oidc_providers", {})
#   }

#   iam_eks_role_tags = {
#     for k, v in var.service_account_role :
#     k => lookup(v, "tags", {})
#   }


# }
