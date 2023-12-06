################
# VPC variables
################
variable "name" {
  type        = string
  description = "Name of VPC"
}

variable "region" {
  type        = string
  description = "Region to deploy resources"
}

variable "vpc_cidr" {
  type = string
  description = "VPC CIDR"
}

variable "private_subnets" {
  type        = list(any)
  description = "Private subnets cidrs"
}

variable "public_subnets" {
  type        = list(any)
  description = "Public subnets cidrs"
}

variable "database_subnets" {
  type        = string
  description = "Database subnets"
}

variable "database_subnet_group_name" {
  type        = string
  description = "Name for database subnet group name"
}


variable "tags" {
  type        = map(string)
  description = "Tags for resources"
}

################
# EKS variables
################

variable "cluster_name" {
  type = string
  description = "EKS cluster name"
}

variable "cluster_version" {
  type = string
  description = "EKS cluster version"
}

variable "developer_usernames" {
  type = list(string)
  description = "Names of developers for aws_auth map and namespaces"
}

variable "admin_usernames" {
  type = list(string)
  description = "Name of admin users and service accounts"
}

variable "namespaces" {
  type = list(string)
  description = "Kubernetes namespaces to create"
}

################
# ECR variables
################

variable "ecr_repos" {
  type = map(any)
  description = "List of ECR repos and configs, see example in default"
  default = {
    "career_service" = {
      name = "career"
      tags = {
        Name        = "career"
        Description = "Career Service ECR"
        Enviroment  = "dev"
      }
    }
  }
}