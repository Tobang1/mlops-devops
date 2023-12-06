data "aws_caller_identity" "current" {}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.3.2"

  for_each = var.config.repos

  repository_name = local.name[each.key]

  create_repository_policy        = local.create_repository_policy[each.key]
  attach_repository_policy        = local.attach_repository_policy[each.key]
  repository_image_tag_mutability = local.repository_image_tag_mutability[each.key]

  repository_read_write_access_arns = local.repository_read_write_access_arns[each.key]
  create_lifecycle_policy           = local.create_lifecycle_policy[each.key]
  repository_lifecycle_policy       = local.repository_lifecycle_policy[each.key]

  tags = local.tags[each.key]
}
