resource "aws_route53_zone" "this" {
  name              = var.zone_name
  force_destroy     = var.force_destroy
  comment           = var.comment
  delegation_set_id = var.delegation_set_id

  dynamic "vpc" {
    for_each = local.vpc
    content {
      vpc_id     = lookup(vpc.value, "vpc_id", null)
      vpc_region = lookup(vpc.value, "vpc_region", null)
    }
  }

  tags = var.zone_tags
}
