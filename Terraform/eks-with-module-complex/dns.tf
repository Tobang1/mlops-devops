# ---------------------------------------
# Route53
# ---------------------------------------
module "route53" {
  source    = "./modules/route53"
  zone_name = var.zone_name
}

module "route53_record_to_dns" {
  source      = "./modules/route53_record"
  zone_id     = var.zone_id_dns_account
  record_type = "NS"
  record_name = var.zone_name
  record_ttl  = var.record_ttl
  records = [
    module.route53.name_servers[0],
    module.route53.name_servers[1],
    module.route53.name_servers[2],
    module.route53.name_servers[3],
  ]

  # Access DNS account where domain is registered through the provider
  providers = {
    aws = aws.dns
  }
}

# module "route53_record_main" {
#   source                        = "../../modules/route53_record"
#   zone_id                       = module.route53.zone_id
#   record_type                   = "A"
#   record_name                   = var.zone_name
#   aliase_name                   = var.route53_aliase_name
#   aliase_zone_id                = var.route53_raliase_zone_id
#   aliase_evaluate_target_health = false
# }

module "route53_record_apex" {
  source      = "./modules/route53_record"
  zone_id     = module.route53.zone_id
  record_type = "CNAME"
  record_name = "*.${var.zone_name}"
  record_ttl  = var.record_ttl
  records     = var.route53_record_apex
}

# module "additional_route_53_cname_record" {
#   source      = "../../modules/route53_record"
#   for_each    = local.additional_route_53_cname_record
#   zone_id     = module.route53.zone_id
#   record_type = "CNAME"
#   record_name = "${each.value.name}.${var.zone_name}"
#   record_ttl  = var.record_ttl
#   records     = each.value.record
# } 
