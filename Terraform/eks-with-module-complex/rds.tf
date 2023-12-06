module "rds" {
  source  = "./modules/rds"

  for_each   = var.rds_db
  identifier = lookup(each.value, "identifier", "demodb")


  # Disable creation of RDS instance(s)
  create_db_instance = lookup(each.value, "create_db_instance", false)
  engine             = lookup(each.value, "engine", "mysql")
  engine_version     = lookup(each.value, "engine_version", "8.0.29")
  instance_class     = lookup(each.value, "instance_class", "db.t2.large")
  # The allocated storage in gigabytes
  allocated_storage = lookup(each.value, "allocated_storage", 5)

  db_name  = lookup(each.value, "db_name", "demodb")
  username = lookup(each.value, "username", "user")
  port     = lookup(each.value, "port", "3306")

  iam_database_authentication_enabled = lookup(each.value, "iam_database_authentication_enabled", false)

  vpc_security_group_ids = lookup(each.value, "vpc_security_group_ids", [])

  maintenance_window = lookup(each.value, "maintenance_window", "Mon:00:00-Mon:03:00")
  backup_window      = lookup(each.value, "backup_window", "03:00-06:00")
  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = lookup(each.value, "monitoring_interval", "30")
  monitoring_role_name   = lookup(each.value, "monitoring_role_name", "MyRDSMonitoringRole")
  create_monitoring_role = lookup(each.value, "create_monitoring_role", false)


  # DB subnet group
  create_db_subnet_group = lookup(each.value, "create_db_subnet_group", false)
  subnet_ids             = lookup(each.value, "subnet_ids", ["subnet-0f97303c2c37c3be3", "subnet-0f2d0f819144f31be"])

  # DB parameter group
  family = lookup(each.value, "family", "mysql8.0")

  # DB option group
  major_engine_version = lookup(each.value, "major_engine_version", "8.0")

  # Database Deletion Protection
  deletion_protection = lookup(each.value, "deletion_protection", false)

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = lookup(each.value, "create_db_parameter_group", false)
  parameters = lookup(each.value, "parameters", [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ])
  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = lookup(each.value, "create_db_option_group", false)
  options = lookup(each.value, "options", [
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
  ])

  tags = lookup(each.value, "tags", {
    Owner       = "user"
    Environment = "dev"
  })
}