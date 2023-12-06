################
# VPC variables
################
region = "eu-west-2"
name = "vpc-dev"
cidr = "10.0.0.0/16"

vpc_cidr = "10.0.0.0/16"

private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

database_subnets = ["10.0.1.0/24", "10.0.2.0/24"] 
database_subnet_group_name = "RDS-vpc-dev"
enable_nat_gateway = true
enable_vpn_gateway = false
single_nat_gateway = true

tags = {
  Terraform   = "true"
  Environment = "dev"
}

################
# EKS variables
################
cluster_name = "dev-eks"
cluster_version = "1.22"

admin_usernames = ["david", "praise", "gabriel", "toba", "dare", "terraform"]
developer_usernames = ["leke", "sola", "raphael", "moses", "ezekiel"]

# ecr_repos = {
#   "ads_service" = {
#     name = "ads"
#     tags = {
#       Name        = "ads"
#       Description = "ADs Service ECR"
#       Enviroment  = "dev"
#     }
#   }
#   "auth_service" = {
#     name = "authentication"
#     tags = {
#       Name        = "authentication"
#       Description = "Authentication Service ECR"
#       Enviroment  = "dev"
#     }
#   }
#   "career_service" = {
#     name = "career"
#     tags = {
#       Name        = "career"
#       Description = "Career Service ECR"
#       Enviroment  = "dev"
#     }
#   }
#   "chat_service" = {
#     name = "chat"
#     tags = {
#       Name        = "chat"
#       Description = "Chat Service ECR"
#       Enviroment  = "dev"
#     }
#   }
#   "complaint_service" = {
#     name = "complaint"
#     tags = {
#       Name        = "complaint"
#       Description = "Complaint Service ECR"
#       Enviroment  = "dev"
#     }
#   }
#   "forum_service" = {
#     name = "forum"
#     tags = {
#       Name        = "forum"
#       Description = "Forums Service ECR"
#       Enviroment  = "dev"
#     }
#   }
#   "notification_service" = {
#     name = "notification"
#     tags = {
#       Name        = "notification"
#       Description = "Notification Service ECR"
#       Enviroment  = "dev"
#     }
#   }
#   "recruitment_service" = {
#     name = "recruitment"
#     tags = {
#       Name        = "recruitment"
#       Description = "Recruitment Service ECR"
#       Enviroment  = "dev"
#     }
#   }
#   "session_service" = {
#     name = "session"
#     tags = {
#       Name        = "session"
#       Description = "Session Service ECR"
#       Enviroment  = "dev"
#     }
#   }
#   "strategy_service" = {
#     name = "strategy"
#     tags = {
#       Name        = "strategy"
#       Description = "Strategy Service ECR"
#       Enviroment  = "dev"
#     }
#   }
#   "gateway_api" = {
#     name = "gateway"
#     tags = {
#       Name        = "gateway"
#       Description = "Gateway API ECR"
#       Enviroment  = "dev"
#     }
#   }

#   "frontend_app" = {
#     name = "frontend_app"
#     tags = {
#       Name        = "frontend_app"
#       Description = "frontend App ECR"
#       Enviroment  = "dev"
#     }
#   }
#   "sandbox" = {
#     name                    = "sandbox"
#     create_lifecycle_policy = true
#     repository_lifecycle_policy = jsonencode({
#       rules = [
#         {
#           rulePriority = 1,
#           description  = "Keep last 30 images",
#           selection = {
#             tagStatus     = "tagged",
#             tagPrefixList = ["latest"],
#             countType     = "imageCountMoreThan",
#             countNumber   = 30
#           },
#           action = {
#             type = "expire"
#           }
#         }
#       ]
#     })
#     tags = {
#       Name        = "sandbox"
#       Description = "Skaffold ECR"
#       Enviroment  = "dev"
#     }
#   }
# }