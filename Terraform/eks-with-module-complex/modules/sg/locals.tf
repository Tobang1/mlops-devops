# locals {

#   name = {
#     for k, v in var.config :
#     k => lookup(v, "name", null)
#   }

#   description = {
#     for k, v in var.config :
#     k => lookup(v, "description", null)
#   }

#   vpc_id = {
#     for k, v in var.config :
#     k => lookup(v, "vpc_id", null)
#   }

#   create = {
#     for k, v in var.config :
#     k => lookup(v, "create", false)
#   }

#   security_group_id = {
#     for k, v in var.config :
#     k => lookup(v, "security_group_id", null)
#   }

#   ingress_cidr_blocks = {
#     for k, v in var.config :
#     k => lookup(v, "ingress_cidr_blocks", [])
#   }

#   ingress_rules = {
#     for k, v in var.config :
#     k => lookup(v, "ingress_rules", [])
#   }

#   ingress_with_cidr_blocks = {
#     for k, v in var.config :
#     k => lookup(v, "ingress_with_cidr_blocks", [])
#   }

#   egress_cidr_blocks = {
#     for k, v in var.config :
#     k => lookup(v, "egress_cidr_blocks", [])
#   }

#   egress_rules = {
#     for k, v in var.config :
#     k => lookup(v, "egress_rules", [])
#   }

# }