module "iam_eks_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.2.0"

  role_name        = var.role_name
  create_role      = var.create_role
  role_policy_arns = var.role_policy_arns
  oidc_providers   = var.oidc_providers
  tags             = var.tags

}