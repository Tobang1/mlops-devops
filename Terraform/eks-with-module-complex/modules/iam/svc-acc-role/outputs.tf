# output "user_details" {
#   value = {
#     for k, v in var.user_config :
#     k => {
#       name              = module.iam_user[k].iam_user_name
#       password          = aws_iam_user_login_profile.this[k].password
#       access_key_id     = module.iam_user[k].iam_access_key_id
#       secret_access_key = module.iam_user[k].iam_access_key_secret
#     }
#   }
# }

# output "group_users" {
#   value = { for k, v in var.group_config :
#   k => module.iam_group_with_policies[k].group_users }
# }