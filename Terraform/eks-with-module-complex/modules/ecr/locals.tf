locals {
  name = {
    for k, v in var.config.repos :
    k => lookup(v, "name", "")
  }
  create_repository_policy = {
    for k, v in var.config.repos :
    k => lookup(v, "create_repository_policy", false)
  }
  attach_repository_policy = {
    for k, v in var.config.repos :
    k => lookup(v, "attach_repository_policy", false)
  }
  repository_image_tag_mutability = {
    for k, v in var.config.repos :
    k => lookup(v, "repository_image_tag_mutability", "MUTABLE")
  }
  repository_read_write_access_arns = {
    for k, v in var.config.repos :
    k => lookup(v, "repository_read_write_access_arns", [data.aws_caller_identity.current.arn])
  }
  create_lifecycle_policy = {
    for k, v in var.config.repos :
    k => lookup(v, "create_lifecycle_policy", false)
  }
  repository_lifecycle_policy = {
    for k, v in var.config.repos :
    k => lookup(v, "repository_lifecycle_policy", "")
  }
  tags = {
    for k, v in var.config.repos :
    k => lookup(v, "tags", {})
  }
}