module "rds" {
  source     = "terraform-aws-modules/rds/aws"
  version    = "4.4.0"
  identifier = var.identifier


  # Disable creation of RDS instance(s)
  create_db_instance = var.create_db_instance
  engine             = var.engine
  engine_version     = var.engine_version
  instance_class     = var.instance_class
  # The allocated storage in gigabytes
  allocated_storage = var.allocated_storage

  db_name  = var.db_name
  username = var.username
  port     = var.port

  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  vpc_security_group_ids = var.vpc_security_group_ids

  maintenance_window = var.maintenance_window
  backup_window      = var.backup_window

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = var.monitoring_interval
  monitoring_role_name   = var.monitoring_role_name
  create_monitoring_role = var.create_monitoring_role


  # DB subnet group
  create_db_subnet_group = var.create_db_subnet_group
  subnet_ids             = var.subnet_ids

  # DB parameter group
  family = var.family

  # DB option group
  major_engine_version = var.major_engine_version

  # Database Deletion Protection
  deletion_protection = var.deletion_protection

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = var.create_db_parameter_group
  parameters                = var.parameters

  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = var.create_db_option_group
  options                = var.options

  tags = var.tags
}