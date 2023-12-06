variable "zone_id" {
  description = "The ID of the hosted zone to contain this record."
  type        = string
}

variable "record_name" {
  description = "The name of the record."
  type        = string
}

variable "record_type" {
  description = "The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT."
  type        = string
}

variable "record_ttl" {
  description = "(Required for non-alias records) The TTL of the record."
  default     = 300
  type        = number
}

variable "records" {
  description = "(Required for non-alias records) A string list of records."
  default     = null
  type        = list(any)
}

variable "weighted_routing_policy_weight" {
  # http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-weighted
  description = "A numeric value indicating the relative weight of the record."
  default     = null
  type        = number
}

variable "set_identifier" {
  description = "Unique identifier to differentiate records with routing policies from one another. Required if using failover, geolocation, latency, or weighted routing policies documented below."
  default     = null
  type        = string
}

variable "aliase_name" {
  description = "DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another resource record set in this hosted zone."
  default     = null
  type        = string
}

variable "aliase_zone_id" {
  description = "Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone."
  default     = null
  type        = string
}

variable "aliase_evaluate_target_health" {
  description = "Set to true if you want Route 53 to determine whether to respond to DNS queries using this resource record set by checking the health of the resource record set."
  default     = null
  type        = bool
}

locals {
  # Logic for weighted_routing_policy block
  weighted_routing_policy_def = {
    "true" = [
      {
        weight = var.weighted_routing_policy_weight
      }
    ]
    "false" = []
  }
  weighted_routing_policy = local.weighted_routing_policy_def[var.weighted_routing_policy_weight != null ? "true" : "false"]

  # Logic for alias block
  alias_def = {
    "true" = [
      {
        name                   = var.aliase_name
        zone_id                = var.aliase_zone_id
        evaluate_target_health = var.aliase_evaluate_target_health
      }
    ]
    "false" = []
  }
  alias = local.alias_def[var.aliase_name != null ? "true" : "false"]

}
