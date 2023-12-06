provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  region = "eu-west-2"
  alias  = "dns"
  assume_role {
    role_arn     = "arn:aws:iam::209390037855:role/OrganizationAccountAccessRole"
    session_name = "RoleSession1"
  }
}

terraform {
  backend "remote" {
    organization = "dareyio-infra"

    workspaces {
      name = "taiwo-wkspace"
    }
  }
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_id]
  }
}


# Helm provider
terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.6.0"
    }
  }
}

provider "helm" {
  kubernetes {
    host = module.eks.cluster_endpoint

    # client_certificate     = file("~/.kube/client-cert.pem")
    # client_key             = file("~/.kube/client-key.pem")
    cluster_ca_certificate = module.eks.cluster_certificate_authority_data
  }
}