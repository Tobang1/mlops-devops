/* locals {
  cluster_name = {
    for k, v in var.config.clusters :
    k => lookup(v, "cluster_name", "dev-eks")
  }
  cluster_version = {
    for k, v in var.config.clusters :
    k => lookup(v, "cluster_version", "1.21")
  }
  cluster_endpoint_private_access = {
    for k, v in var.config.clusters :
    k => lookup(v, "cluster_endpoint_private_access", true)
  }
  cluster_endpoint_public_access = {
    for k, v in var.config.clusters :
    k => lookup(v, "cluster_endpoint_public_access", true)
  }
  cluster_addons = {
    for k, v in var.config.clusters :
    k => lookup(v, "cluster_endpoint_public_access", {
      coredns = {
        resolve_conflicts = "OVERWRITE"
      }
      kube-proxy = {}
      vpc-cni = {
        resolve_conflicts = "OVERWRITE"
      }
    })
  }
  vpc_id = {
    for k, v in var.config.clusters :
    k => lookup(v, "vpc_id", "vpc-1234556abcdef")
  }
  subnet_ids = {
    for k, v in var.config.clusters :
    k => lookup(v, "subnet_ids", ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"])
  }
  eks_managed_node_group_defaults = {
    for k, v in var.config.clusters :
    k => lookup(v, "eks_managed_node_group_defaults", {
      disk_size      = 50
      instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
    })
  }
  eks_managed_node_groups = {
    for k, v in var.config.clusters :
    k => lookup(v, "eks_managed_node_groups", {
      dev-eks = {
        min_size     = 2
        max_size     = 10
        desired_size = 2

        instance_types = ["t3.large"]
        capacity_type  = "SPOT"
      }
    })
  }
  admin_users = {
    for k, v in var.config.clusters :
    k => [
      for admin in var.config.admins :
      {
        userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${admin}"
        username = "${admin}"
        groups   = ["system:masters"]
      }
    ]
  }
  manage_aws_auth_configmap = {
    for k, v in var.config.clusters :
    k => lookup(v, "manage_aws_auth_configmap", false)
  }
  aws_auth_users = {
    for k, v in var.config.clusters :
    k => setunion(toset(local.admin_users[k]), [
      for developer in var.config.developers :
      {
        userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${developer}"
        username = "${developer}"
        groups   = ["developers:${developer}"]
      }
    ])
  }
  tags = {
    for k, v in var.config.clusters :
    k => lookup(v, "tags", {})
  }
} */
