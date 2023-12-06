# locals {

#   identifier = {
#     for k, v in var.config :
#     k => lookup(v, "identifier", "")
#   }

#   create_db_instance = {
#     for k, v in var.config :
#     k => lookup(v, "create_db_instance", false)
#   }

#   engine = {
#     for k, v in var.config :
#     k => lookup(v, "engine", "")
#   }

#   engine_version = {
#     for k, v in var.config :
#     k => lookup(v, "engine_version", "")
#   }

#   instance_class = {
#     for k, v in var.config :
#     k => lookup(v, "instance_class", "")
#   }

#   allocated_storage = {
#     for k, v in var.config :
#     k => lookup(v, "allocated_storage", "")
#   }

#   db_name = {
#     for k, v in var.config :
#     k => lookup(v, "db_name", "")
#   }

#   username = {
#     for k, v in var.config :
#     k => lookup(v, "username", "")
#   }

#   port = {
#     for k, v in var.config :
#     k => lookup(v, "port", "")
#   }

#   iam_database_authentication_enabled = {
#     for k, v in var.config :
#     k => lookup(v, "iam_database_authentication_enabled", "")
#   }

#   vpc_security_group_ids = {
#     for k, v in var.config :
#     k => lookup(v, "vpc_security_group_ids", [])
#   }

#   maintenance_window = {
#     for k, v in var.config :
#     k => lookup(v, "maintenance_window", "")
#   }

#   backup_window = {
#     for k, v in var.config :
#     k => lookup(v, "backup_window", "")
#   }

#   monitoring_interval = {
#     for k, v in var.config :
#     k => lookup(v, "monitoring_interval", "")
#   }

#   monitoring_role_name = {
#     for k, v in var.config :
#     k => lookup(v, "monitoring_role_name", "")
#   }

#   create_monitoring_role = {
#     for k, v in var.config :
#     k => lookup(v, "create_monitoring_role", false)
#   }

#   create_db_subnet_group = {
#     for k, v in var.config :
#     k => lookup(v, "create_db_subnet_group", false)
#   }

#   subnet_ids = {
#     for k, v in var.config :
#     k => lookup(v, "subnet_ids", [])
#   }

#   family = {
#     for k, v in var.config :
#     k => lookup(v, "family", "")
#   }

#   major_engine_version = {
#     for k, v in var.config :
#     k => lookup(v, "major_engine_version", "")
#   }

#   deletion_protection = {
#     for k, v in var.config :
#     k => lookup(v, "deletion_protection", false)
#   }

#   create_db_parameter_group = {
#     for k, v in var.config :
#     k => lookup(v, "create_db_parameter_group", false)
#   }

#   parameters = {
#     for k, v in var.config :
#     k => lookup(v, "parameters", [])
#   }

#   create_db_option_group = {
#     for k, v in var.config :
#     k => lookup(v, "create_db_option_group", false)
#   }

#   options = {
#     for k, v in var.config :
#     k => lookup(v, "options", [])
#   }

#   tags = {
#     for k, v in var.config :
#     k => lookup(v, "tags", {})
#   }

# }