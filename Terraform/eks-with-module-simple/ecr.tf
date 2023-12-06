# data "aws_caller_identity" "current" {}

# module "ecr" {
#   source  = "terraform-aws-modules/ecr/aws"
#   version = "1.3.2"

#   for_each = var.ecr_repos

#   repository_name = each.value["name"]

#   create_repository_policy        = lookup(each.value, "create_repository_policy", false)
#   attach_repository_policy        = lookup(each.value, "attach_repository_policy", false)
#   repository_image_tag_mutability = lookup(each.value, "repository_image_tag_mutability", false)

#   repository_read_write_access_arns = lookup(each.value, "repository_read_write_access_arns", false)
#   create_lifecycle_policy           = lookup(each.value, "create_lifecycle_policy", false)
#   repository_lifecycle_policy       = lookup(each.value, "repository_lifecycle_policy", false)

#   tags = each.value["tags"]
# }