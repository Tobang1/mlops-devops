module "kms" {
  source  = "./modules/kms"

  for_each = var.kms_keys

  description             = lookup(each.value, "description", "")
  deletion_window_in_days = lookup(each.value, "deletion_window_in_days", null)
  enable_key_rotation     = lookup(each.value, "enable_key_rotation", false)
  is_enabled              = lookup(each.value, "is_enabled", false)
  key_usage               = lookup(each.value, "key_usage", "")
  multi_region            = lookup(each.value, "multi_region", false)

  # Policy
  enable_default_policy = lookup(each.value, "enable_default_policy", false)
  key_owners            = lookup(each.value, "key_owners", [/*data.aws_iam_role.vault_kms.arn*/])
  key_administrators    = lookup(each.value, "key_administrators", [/*data.aws_iam_role.vault_kms.arn*/])
  key_users             = lookup(each.value, "key_users", [/*data.aws_iam_role.vault_kms.arn*/])

  # Aliases
  aliases                 = lookup(each.value, "aliases", [])
  aliases_use_name_prefix = lookup(each.value, "aliases_use_name_prefix", false)

  tags = lookup(each.value, "tags", {})
}