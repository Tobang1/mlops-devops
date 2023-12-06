module "s3_bucket" {
  source  = "./modules/s3"

  for_each      = var.s3_buckets
  create_bucket = lookup(each.value, "create_bucket", false)

  bucket = lookup(each.value, "bucket", "")
  acl    = lookup(each.value, "acl", "")

  policy        = lookup(each.value, "policy", file("${path.root}/policies/s3_policy.json"))
  attach_policy = lookup(each.value, "attach_policy", false)

  versioning          = lookup(each.value, "versioning", {})
  object_lock_enabled = lookup(each.value, "object_lock_enabled", false)
}