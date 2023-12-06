variable "identifier" {
  type = string
  default = "demords"
}
variable "create_db_instance" {
  type = bool
  default = false
}
variable "engine" {
  type = string
  default = "mysql"
}
variable "engine_version" {
  type = string
  default = "8.0.29"
}
variable "instance_class" {
  type = string
  default = "db.t2.large"
}
variable "allocated_storage" {
  type = number
  default = 6
  description = "The allocated storage in gigabytes"
}
variable "db_name" {
  type = string
  default = "demords"
}
variable "username" {
  type = string
  default = "admin"
}
variable "port" {
  type = string
  default = "3306"
}
variable "iam_database_authentication_enabled" {
  type = bool
  default = true
}
variable "vpc_security_group_ids" {
  type = list
  default = []
}
variable "maintenance_window" {
  type = string
  default = "Mon:00:00-Mon:03:00"
}
variable "backup_window" {
  type = string
  default = "03:00-06:00"
}
variable "monitoring_interval" {
  type = string
  default = "30"
}
variable "monitoring_role_name" {
  type = string
  default = ""
}
variable "create_monitoring_role" {
  type = bool
  default = false
}
variable "create_db_subnet_group" {
  type = bool
  default = false
}
variable "subnet_ids" {
  type = list(string)
}
variable "family" {
  type = string
  default = "mysql8.0"
}
variable "major_engine_version" {
  type = string
  default = "8.0"
}
variable "deletion_protection" {
  type = bool
  default = false
}
variable "create_db_parameter_group" {
  type = bool
  default = false
}
variable "parameters" {
  type = any
  default = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]
}
variable "create_db_option_group" {
  type = bool
  default = false
}
variable "options" {
  type = any
  default = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}
variable "tags" {
  type = map
  default = {}
}