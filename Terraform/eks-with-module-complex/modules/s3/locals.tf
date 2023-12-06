# locals {

#   create_bucket = {
#     for k, v in var.config :
#     k => lookup(v, "create_bucket", false)
#   }

#   bucket = {
#     for k, v in var.config :
#     k => lookup(v, "bucket", null)
#   }

#   acl = {
#     for k, v in var.config :
#     k => lookup(v, "acl", null)
#   }

#   policy = {
#     for k, v in var.config :
#     k => lookup(v, "policy", null)
#   }

#   attach_policy = {
#     for k, v in var.config :
#     k => lookup(v, "attach_policy", false)
#   }

#   versioning = {
#     for k, v in var.config :
#     k => lookup(v, "versioning", {})
#   }

#   object_lock_enabled = {
#     for k, v in var.config :
#     k => lookup(v, "object_lock_enabled", false)
#   }

# }