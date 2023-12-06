variable "zone_name" {
  description = "This is the name of the hosted zone."
  default     = null
  type        = string
}

variable "zone_tags" {
  description = "A map of tags to assign to the zone."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
  default     = null
  type        = bool
}

variable "comment" {
  description = "A comment for the hosted zone. Defaults to 'Managed by Terraform'."
  default     = null
  type        = string
}

variable "delegation_set_id" {
  description = <<DOCHERE
The ID of the reusable delegation set whose NS records you want to assign to the hosted zone.
Conflicts with vpc as delegation sets can only be used for public zones.
DOCHERE
  default     = null
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to associate."
  default     = null
  type        = string
}

variable "vpc_region" {
  description = "Region of the VPC to associate. Defaults to AWS provider region."
  default     = null
  type        = string
}


locals {
  # Logic for VPC block
  vpc_def = {
    "true" = [
      {
        vpc_id     = var.vpc_id
        vpc_region = var.vpc_region
      }
    ]
    "false" = []
  }
  vpc = local.vpc_def[var.vpc_id != null ? "true" : "false"]

}
