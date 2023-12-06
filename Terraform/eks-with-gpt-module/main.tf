provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "eks-vpc"
  }
}



resource "aws_subnet" "private-eu-west-2a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "eu-west-2a"

  tags = {
    "Name"                            = "private-eu-westt-2a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "private-eu-west-2b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "eu-west-2b"

  tags = {
    "Name"                            = "private-eu-west-2b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "public-eu-west-2a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-eu-west-2a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "public-eu-west-2b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-eu-west-2b"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}




module "eks_cluster" {
  source        = "terraform-aws-modules/eks/aws"
  cluster_name  = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids       = [ 
    aws_subnet.private-eu-west-2a.id, 
    aws_subnet.private-eu-west-2b.id, 
    aws_subnet.public-eu-west-2a.id, 
    aws_subnet.public-eu-west-2b.id
  ]
  vpc_id        = aws_vpc.main.id

  eks_managed_node_group_defaults = {
  disk_size      = 50
  instance_types = ["t3.medium", "t3.large"]
  }

  eks_managed_node_groups = {
    dev-eks = {
      min_size     = var.min_capacity
      max_size     = var.max_capacity
      desired_size = var.desired_capacity

      instance_types = var.instance_type
      capacity_type  = "SPOT"
    }
  }


  # node_groups = [{
  #   instance_type        = var.instance_type
  #   desired_capacity     = var.desired_capacity
  #   max_capacity         = var.max_capacity
  #   min_capacity         = var.min_capacity
  #   key_name             = var.key_name
  #   volume_size          = var.volume_size
  #   volume_type          = var.volume_type
  #   kubelet_extra_args   = var.kubelet_extra_args
  #   tags = {
  #     Terraform   = "true"
  #     Environment = "dev"
  #   }
  # }]
}

