module "sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  create      = var.create

  # ID of existing security group whose rules we will manage
  security_group_id = var.security_group_id
  # Check https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/4.9.0#input_rules for Map of known security group rules
  ingress_cidr_blocks      = var.ingress_cidr_blocks
  ingress_rules            = var.ingress_rules
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
  egress_cidr_blocks       = var.egress_cidr_blocks
  egress_rules             = var.egress_rules
}