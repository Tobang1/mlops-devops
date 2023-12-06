locals {
  developers = [
    for developer in var.developer_usernames : 
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${developer}"
      username = "${developer}"
      groups   = ["developers:${developer}"]
    }
  ]
  admins = [
    for admin in var.admin_usernames : 
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${admin}"
      username = "${admin}"
      groups   = ["system:masters"]
    }
  ]
  namespaces = concat(var.developer_usernames, var.namespaces)
}