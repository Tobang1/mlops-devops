module "chartmuseum_eks_role_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.1.0"

  name          = "chartmuseum-policy"
  create_policy = true
  path          = "/"
  description   = "Chartmuseum policy to access Chartmuseum bucket"
  policy        = file("./policies/chartmuseum-policy.json")
}