module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = var.name
  cidr = var.vpc_cidr

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets



  create_database_subnet_group = true
  database_subnets             = var.database_subnets
  database_subnet_group_name   = var.database_subnet_group_name



  manage_default_route_table = true
  default_route_table_tags   = { Name = "${var.name}-default" }

  manage_default_security_group = true
  default_security_group_tags   = { Name = "${var.name}-default" }

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_classiclink             = true
  enable_classiclink_dns_support = true

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = var.tags
}
