output "name_servers" {
  description = "A list of name servers in associated (or default) delegation set."
  value       = aws_route53_zone.this.name_servers
}

output "zone_id" {
  description = "The Hosted Zone ID. This can be referenced by zone records.."
  value       = aws_route53_zone.this.zone_id
}
