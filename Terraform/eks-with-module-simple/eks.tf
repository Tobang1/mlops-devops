module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.21.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    disk_size      = 50
    instance_types = ["m5.large", "t3.large"]
  }

  eks_managed_node_groups = {
    dev-eks = {
      min_size     = 2
      max_size     = 10
      desired_size = 2

      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
    }
  }

  manage_aws_auth_configmap = true
  aws_auth_users            = concat(local.admins, local.developers)

  tags = var.tags
}
