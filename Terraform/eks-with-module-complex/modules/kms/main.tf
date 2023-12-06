module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "1.0.2"

  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  is_enabled              = var.is_enabled
  key_usage               = var.key_usage
  multi_region            = var.multi_region
  enable_default_policy   = var.enable_default_policy
  key_owners              = var.key_owners
  key_administrators      = var.key_administrators
  key_users               = var.key_users
  aliases                 = var.aliases
  aliases_use_name_prefix = var.aliases_use_name_prefix
  grants                  = var.grants
  tags                    = var.tags
}