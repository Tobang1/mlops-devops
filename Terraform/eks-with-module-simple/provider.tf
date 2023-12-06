provider "aws" {
  region = "eu-west-2"
}


# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 3.0"
#     }
#   }
# }

# # provider "aws" {
#   region = "eu-west-2"
#   alias  = "dns"
#   assume_role {
#     role_arn     = "arn:aws:iam::209390037855:role/OrganizationAccountAccessRole"
#     session_name = "RoleSession1"
#   }
# }