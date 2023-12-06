# locals {
#   description = {
#     for k, v in var.config :
#     k => lookup(v, "description", "")
#   }
#   deletion_window_in_days = {
#     for k, v in var.config :
#     k => lookup(v, "deletion_window_in_days", null)
#   }
#   enable_key_rotation = {
#     for k, v in var.config :
#     k => lookup(v, "enable_key_rotation", false)
#   }
#   is_enabled = {
#     for k, v in var.config :
#     k => lookup(v, "is_enabled", false)
#   }
#   key_usage = {
#     for k, v in var.config :
#     k => lookup(v, "key_usage", "")
#   }
#   multi_region = {
#     for k, v in var.config :
#     k => lookup(v, "multi_region", false)
#   }

#   # Policy
#   enable_default_policy = {
#     for k, v in var.config :
#     k => lookup(v, "enable_default_policy", false)
#   }
#   key_owners = {
#     for k, v in var.config :
#     k => lookup(v, "key_owners", [])
#   }
#   key_administrators = {
#     for k, v in var.config :
#     k => lookup(v, "key_administrators", [])
#   }
#   key_users = {
#     for k, v in var.config :
#     k => lookup(v, "key_users", [])
#   }

#   # Aliases
#   aliases = {
#     for k, v in var.config :
#     k => lookup(v, "aliases", [])
#   }
#   aliases_use_name_prefix = {
#     for k, v in var.config :
#     k => lookup(v, "aliases_use_name_prefix", false)
#   }

#   # Grants
#   grants = {
#     for k, v in var.config :
#     k => lookup(v, "grants", {})
#   }

#   tags = {
#     for k, v in var.config :
#     k => lookup(v, "tags", {})
#   }
# }