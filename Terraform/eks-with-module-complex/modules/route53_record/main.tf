resource "aws_route53_record" "this" {
  zone_id        = var.zone_id
  name           = var.record_name
  type           = var.record_type
  ttl            = var.record_ttl
  records        = var.records
  set_identifier = var.set_identifier

  dynamic "weighted_routing_policy" {
    for_each = local.weighted_routing_policy
    content {
      weight = lookup(weighted_routing_policy.value, "weight", null)
    }
  }

  dynamic "alias" {
    for_each = local.alias
    content {
      name                   = lookup(alias.value, "name", null)
      zone_id                = lookup(alias.value, "zone_id", null)
      evaluate_target_health = lookup(alias.value, "evaluate_target_health", null)
    }
  }
}
