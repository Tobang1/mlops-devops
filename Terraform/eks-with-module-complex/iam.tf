# Group Users
module "iam_group_with_policies" {
  source  = "./modules/iam/group"

  for_each = var.Groups

  name                              = lookup(each.value, "group_name", "")
  group_users                       = [for k, v in each.value["user"] : v.name]
  attach_iam_self_management_policy = lookup(each.value, "attach_iam_self_management_policy", true)
  # custom_group_policy_arns = each.value.iam_read_only_policy.create_policy ? [
  #   module.iam_read_only_policy[each.key].arn,
  # module.iam_policy[each.key].arn, ] : [module.iam_policy[each.key].arn, ]

#IAM Read onlu Policy
  iam_read_only_policy_name                       = lookup(each.value["iam_read_only_policy"], "name", "")
  iam_read_only_policy_path                       = lookup(each.value["iam_read_only_policy"], "path", "/")
  iam_read_only_policy_description                = lookup(each.value["iam_read_only_policy"], "description", "/")
  iam_read_only_policy_allowed_services           = lookup(each.value["iam_read_only_policy"], "allowed_services", local.developers_allowed_services)
  iam_read_only_policy_allow_web_console_services = lookup(each.value["iam_read_only_policy"], "allow_web_console_services", true)
  iam_read_only_policy_create_policy              = lookup(each.value["iam_read_only_policy"], "create_policy", true)
  iam_read_only_policy_web_console_services       = lookup(each.value["iam_read_only_policy"], "web_console_services", ["resource-groups", "tag", "health", "ce"])

  # IAM Policy Role
  iam_policy_name          = lookup(each.value["iam_policy"], "name", "")
  iam_policy_create_policy = lookup(each.value["iam_policy"], "create_policy", false)
  iam_policy_path          = lookup(each.value["iam_policy"], "path", "/")
  iam_policy_description   = lookup(each.value["iam_policy"], "description", "${each.key} iam-policy")
  iam_policy_policy        = lookup(each.value["iam_policy"], "policy", local.group_policies[each.key].policy)

  depends_on = [
    module.iam_user
  ]

}



# User module
module "iam_user" {
  source  = "./modules/iam/user"

  for_each                      = local.users
  name                          = lookup(each.value, "name", "")
  force_destroy                 = lookup(each.value, "force_destroy", true)
  create_user                   = lookup(each.value, "create_user", false)
  create_iam_user_login_profile = false
  password_length               = lookup(each.value, "password_length", 30)
  permissions_boundary          = lookup(each.value, "permissions_boundary", "")
  create_iam_access_key         = lookup(each.value, "create_iam_access_key", false)
  password_reset_required       = lookup(each.value, "password_reset_required", true)
}


module "iam_eks_role" {
  source  = "./modules/iam/svc-acc-role"

  for_each = var.service_account_role

  role_name        = lookup(each.value, "role_name", "")
  create_role      = lookup(each.value, "create_role", false)
  role_policy_arns = lookup(each.value, "role_policy_arns", "")
  oidc_providers   = lookup(local.service_account_role_oidc_providers, each.key, {}) ## Set EKS Cluster OIDC
  tags             = lookup(each.value, "tags", var.tags)
}

module "chartmuseum_eks_role_iam_policy" {
  source  = "./modules/iam/policy"

  name          = "chartmuseum-policy"
  create_policy = true
  path          = "/"
  description   = "Chartmuseum policy to access Chartmuseum bucket"
  policy        = file("./policies/chartmuseum-policy.json")
}