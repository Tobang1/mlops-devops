module "eks" {
  source  = "./modules/eks"
  environment = "dev"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access

  cluster_addons = var.cluster_addons

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = var.eks_managed_node_group_defaults

  eks_managed_node_groups = var.eks_managed_node_groups

  manage_aws_auth_configmap = var.manage_aws_auth_configmap
  aws_auth_users            = concat(local.aws_auth_admins, local.aws_auth_developers)
  aws_auth_roles            = local.aws_auth_roles

  tags = var.tags
}

# create namespaces
resource "kubernetes_namespace" "namespaces" {
  for_each = toset(local.namespaces)
  metadata {
    labels = {
      managed_by = "terraform"
    }

    name = each.key
  }
}


resource "kubernetes_role" "developers_role" {
  for_each = toset(var.developer_usernames)
  metadata {
    name      = "${each.key}-role"
    namespace = each.key
    labels = {
      managed_by = "terraform"
    }
  }

  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["*"]
  }
  depends_on = [
    kubernetes_namespace.namespaces
  ]
}

resource "kubernetes_role_binding" "developers" {
  for_each = toset(var.developer_usernames)
  metadata {
    name      = "${each.key}-role-binding"
    namespace = each.key
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "${each.key}-role"
  }
  subject {
    kind      = "Group"
    name      = "developers:${each.key}"
    api_group = "rbac.authorization.k8s.io"
  }
  depends_on = [
    kubernetes_namespace.namespaces
  ]
}
