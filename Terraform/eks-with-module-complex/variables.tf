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
  type        = string
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
  type        = list(string)
  description = "Database subnets"
  default     = []
}

variable "database_subnet_group_name" {
  type        = string
  description = "Name for database subnet group name"
  default     = ""
}


variable "tags" {
  type        = map(string)
  description = "Tags for resources"
}

################
# EKS variables
################

variable "environment" {
  type        = string
  description = "Enviroment to deploy resources"
}

variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "cluster_endpoint_private_access" {
  type = bool
  default = true
}

variable "cluster_endpoint_public_access" {
  type = bool
  default = true
}

variable "cluster_addons" {
  type = map(any)
  default = {}
}

variable "eks_managed_node_group_defaults" {
  type = map(any)
  default = {
    "key" = "value"
  }
}

variable "eks_managed_node_groups" {
  type = map(any)
}

variable "manage_aws_auth_configmap" {
  type = bool
  default = true
}

variable "developer_usernames" {
  type        = list(string)
  description = "Names of developers for aws_auth map and namespaces"
}

variable "admin_usernames" {
  type        = list(string)
  description = "Name of admin users"
}

variable "admin_roles" {
  type        = list(string)
  description = "Name of admin roles and service accounts"
}

variable "namespaces" {
  type        = list(string)
  description = "Kubernetes namespaces to create"
  default     = []
}

################
# ECR variables
################

variable "ecr_repos" {
  type        = map(any)
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

#######################
# KMS Variable
#######################
variable "kms_keys" {
  type        = map(any)
  description = "AWS KMS key variable"
  sensitive   = false
}

#############################
# Security Group Variable
#############################
variable "security_groups" {
  type        = any
  description = "Security groups configuration"
  sensitive   = false
}

######################
# S3 Buckets
######################
variable "s3_buckets" {
  type        = map(any)
  description = "S3 buckets configuration"
  sensitive   = false
}

######################
# RDS Buckets
######################
variable "rds_db" {
  type        = map(any)
  description = "Database configuration configuration"
  sensitive   = false
}

##########################################
# IAM EKS Service Account Role Variable
##########################################

variable "service_account_role" {
  type        = map(any)
  description = "AWS EKS Service Account Role"
  sensitive   = false
}

#########################
# IAM Variable
#########################

variable "Groups" {
  description = "IAM User Groups"
}

#########################
# Route 53
#########################

variable "zone_name" {
  type        = string
  description = "zone name"
}

variable "record_ttl_for_ns" {
  type        = string
  description = "record ttl"
}

variable "zone_id_dns_account" {
  type = string
}

variable "route53_aliase_name" {
  type = string

}

variable "route53_raliase_zone_id" {
  type = string
}

variable "record_ttl" {
  type = number
}

variable "route53_record_apex" {
  type = list(any)
}