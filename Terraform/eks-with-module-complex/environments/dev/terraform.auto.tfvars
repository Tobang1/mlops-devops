################
# VPC variables
################
name     = "vpc-dev"
vpc_cidr = "10.0.0.0/16"
region   = "eu-west-2"

private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

database_subnets           = ["10.0.1.0/24", "10.0.2.0/24"]
database_subnet_group_name = "RDS-vpc-dev"
enable_nat_gateway         = true
enable_vpn_gateway         = false
single_nat_gateway         = true

tags = {
  Terraform   = "true"
  Environment = "dev"
}

################
# EKS variables
################
cluster_name    = "dev-eks"
cluster_version = "1.22"

cluster_endpoint_private_access = true
cluster_endpoint_public_access  = true

eks_managed_node_groups = {
  dev-eks = {
    min_size     = 2
    max_size     = 10
    desired_size = 4

    instance_types = ["t3.large"]
    capacity_type  = "SPOT"
  }
}

admin_usernames     = ["david", "praise", "gabriel", "toba", "dare", "terraform"]
developer_usernames = ["leke", "sola", "raphael", "moses", "ezekiel"]
admin_roles         = ["terraform"]

ecr_repos = {
  "ads_service" = {
    name = "ads"
    tags = {
      Name        = "ads"
      Description = "ADs Service ECR"
      Enviroment  = "dev"
    }
  }
  "auth_service" = {
    name = "authentication"
    tags = {
      Name        = "authentication"
      Description = "Authentication Service ECR"
      Enviroment  = "dev"
    }
  }
  "career_service" = {
    name = "career"
    tags = {
      Name        = "career"
      Description = "Career Service ECR"
      Enviroment  = "dev"
    }
  }
  "chat_service" = {
    name = "chat"
    tags = {
      Name        = "chat"
      Description = "Chat Service ECR"
      Enviroment  = "dev"
    }
  }
  "complaint_service" = {
    name = "complaint"
    tags = {
      Name        = "complaint"
      Description = "Complaint Service ECR"
      Enviroment  = "dev"
    }
  }
  "forum_service" = {
    name = "forum"
    tags = {
      Name        = "forum"
      Description = "Forums Service ECR"
      Enviroment  = "dev"
    }
  }
  "notification_service" = {
    name = "notification"
    tags = {
      Name        = "notification"
      Description = "Notification Service ECR"
      Enviroment  = "dev"
    }
  }
  "recruitment_service" = {
    name = "recruitment"
    tags = {
      Name        = "recruitment"
      Description = "Recruitment Service ECR"
      Enviroment  = "dev"
    }
  }
  "session_service" = {
    name = "session"
    tags = {
      Name        = "session"
      Description = "Session Service ECR"
      Enviroment  = "dev"
    }
  }
  "strategy_service" = {
    name = "strategy"
    tags = {
      Name        = "strategy"
      Description = "Strategy Service ECR"
      Enviroment  = "dev"
    }
  }
  "gateway_api" = {
    name = "gateway"
    tags = {
      Name        = "gateway"
      Description = "Gateway API ECR"
      Enviroment  = "dev"
    }
  }

  "frontend_app" = {
    name = "frontend_app"
    tags = {
      Name        = "frontend_app"
      Description = "frontend App ECR"
      Enviroment  = "dev"
    }
  }
  /* "sandbox" = {
    name                    = "sandbox"
    create_lifecycle_policy = true
    repository_lifecycle_policy = {
      rules = [
        {
          rulePriority = 1,
          description  = "Keep last 30 images",
          selection = {
            tagStatus     = "tagged",
            tagPrefixList = ["latest"],
            countType     = "imageCountMoreThan",
            countNumber   = 30
          },
          action = {
            type = "expire"
          }
        }
      ]
    }
    tags = {
      Name        = "sandbox"
      Description = "Skaffold ECR"
      Enviroment  = "dev"
    }
  } */
}



###########
# AWS KMS #
###########
kms_keys = {
  vault_kms = {
    description             = "Vault KMS Key for Auto-unseal"
    deletion_window_in_days = null
    enable_key_rotation     = true
    is_enabled              = true
    key_usage               = "ENCRYPT_DECRYPT"
    multi_region            = false

    # Policy
    enable_default_policy = true
    # key_owners            = [data.aws_iam_role.vault_kms.arn]
    # key_administrators    = [data.aws_iam_role.vault_kms.arn]
    # key_users             = [data.aws_iam_role.vault_kms.arn]

    # Aliases
    aliases                 = ["dev-vault-kms"]
    aliases_use_name_prefix = true

    tags = {
      Terraform   = "true"
      Environment = "dev"
    }
  }
}

##################
# Security Group #
##################
security_groups = {
  eks_worker_node = {
    name        = "argocd"
    description = "EKS worker node security group"
    create      = true
    security_group_id = ""
    ingress_cidr_blocks      = ["10.0.0.0/16"]
    egress_cidr_blocks       = ["10.0.0.0/16"]
    ingress_rules            = ["http-80-tcp",]
    egress_rules             = ["http-80-tcp",]
    ingress_with_cidr_blocks = [
      {
        from_port   = 8080
        to_port     = 8084
        protocol    = "tcp"
        description = "open port range 8080-8084/tcp ingress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 9000
        to_port     = 9000
        protocol    = "tcp"
        description = "open port 9000/tcp ingress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 5556
        to_port     = 5558
        protocol    = "tcp"
        description = "open port 5556-5558/tcp ingress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 7000
        to_port     = 7000
        protocol    = "tcp"
        description = "open port 7000/tcp ingress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 9001
        to_port     = 9001
        protocol    = "tcp"
        description = "open port 9001/tcp ingress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        description = "open port 3000 ingress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 9090
        to_port     = 9093
        protocol    = "tcp"
        description = "open port 9090-9093/tcp ingress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 2181
        to_port     = 2181
        protocol    = "tcp"
        description = "open port 2181/tcp ingress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 2888
        to_port     = 2888
        protocol    = "tcp"
        description = "open port 2888/tcp ingress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 3888
        to_port     = 3888
        protocol    = "tcp"
        description = "open port 3888/tcp ingress rule"
        cidr_blocks = "10.0.0.0/16"
      },      
    ]
    egress_with_cidr_blocks = [
      {
        from_port   = 8080
        to_port     = 8084
        protocol    = "tcp"
        description = "open port range 8080-8084/tcp egress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 5556
        to_port     = 5558
        protocol    = "tcp"
        description = "open port 9000/tcp egress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 7000
        to_port     = 7000
        protocol    = "tcp"
        description = "open port 5556-5558/tcp egress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 9001
        to_port     = 9001
        protocol    = "tcp"
        description = "open port 7000/tcp egress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 9000
        to_port     = 9000
        protocol    = "tcp"
        description = "open port 9001/tcp egress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        description = "open port 3000 egress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 9090
        to_port     = 9093
        protocol    = "tcp"
        description = "open port 9090-9093/tcp egress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 2181
        to_port     = 2181
        protocol    = "tcp"
        description = "open port 2181/tcp egress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 2888
        to_port     = 2888
        protocol    = "tcp"
        description = "open port 2888/tcp egress rule"
        cidr_blocks = "10.0.0.0/16"
      },
      {
        from_port   = 3888
        to_port     = 3888
        protocol    = "tcp"
        description = "open port 3888/tcp egress rule"
        cidr_blocks = "10.0.0.0/16"
      },
    ]
  }
}

############
# S3 Bucket#
############
s3_buckets = {
  chartmuseum = {
    create_bucket = true

    bucket = "darey-io-chartmuseum"
    acl    = "private"

    attach_policy = false

    versioning = {
      enabled = true
    }

    object_lock_enabled = true
  }
}

############
# RDS DB#
############
rds_db = {
  example_rds = {
    identifier = "demodb"

    # Disable creation of RDS instance(s)
    create_db_instance = false
    engine             = "mysql"
    engine_version     = "8.0"
    instance_class     = "db.t2.large"

    # The allocated storage in gigabytes
    allocated_storage = 5

    db_name  = "demodb"
    username = "user"
    port     = "3306"

    maintenance_window = "Mon:00:00-Mon:03:00"
    backup_window      = "03:00-06:00"

    # Enhanced Monitoring - see example for details on how to create the role
    # by yourself, in case you don't want to create it automatically
    monitoring_interval    = "30"
    monitoring_role_name   = "MyRDSMonitoringRole"
    create_monitoring_role = false

    # DB subnet group
    create_db_subnet_group = false

    # DB parameter group
    family = "mysql8.0"

    # DB option group
    major_engine_version = "8.0"

    # Database Deletion Protection
    deletion_protection = false
  }
}


#################################
# IAM Group, User and Policy #
#################################
Groups = {
  Developers = {
    group_name = "Developers"

    attach_iam_self_management_policy = true
    iam_read_only_policy = {
      name                       = "ReadOnlyDevelopers"
      create_policy              = true
      path                       = "/"
      description                = "Developers read-only policy"
      allow_web_console_services = true
    }

    iam_policy = {
      name          = "AllowCRUDDevelopers"
      create_policy = true
      path          = "/"
      description   = "Admin Access To Developers policy"
    }

    ecr_policy = {
      name          = "AllowFullECRAccess"
      create_policy = true
      path          = "/"
      description   = "Admin Access ECR"
      # policies      = file("policies/FullECRAccess.json")
    }

    user = {
      Adeleke_Joseph = {
        name        = "leke"
        create_user = true
      }

      Sola_Paul = {
        name        = "sola"
        create_user = true
      }

      Akinola_Raphael = {
        name        = "ralph"
        create_user = true
      }

      Moses_Oderinde = {
        name        = "moses"
        create_user = true
      }

      Ogbu_Ezekiel = {
        name        = "ezekiel"
        create_user = true
      }
    }
  }

  Administrators = {
    group_name = "Administrators"

    attach_iam_self_management_policy = true
    iam_read_only_policy = {
      name                       = "ReadOnlyAdministrators"
      create_policy              = false
      path                       = "/"
      description                = "Developers read-only policy"
      allow_web_console_services = true
      web_console_services       = ["resource-groups", "tag", "health", "ce"]
    }

    iam_policy = {
      name          = "AllowCRUDAdministrators"
      create_policy = true
      path          = "/"
      description   = "Admin Access To Developers policy"
    }

    user = {
      Gabriel_Akinmoyero = {
        name        = "gabriel"
        create_user = true
      }

      Joseph_Akinola = {
        name        = "toba"
        create_user = true
      }

      Praise_Anefu = {
        name        = "praise"
        create_user = true
      }

      David_Adebayo = {
        name        = "david"
        create_user = true
      }

      Dare_Olufunmilayo = {
        name        = "dare"
        create_user = true
      }
      TImi_Olunfunmilayo = {
        name        = "timi"
        create_user = true
      }
      Taiwo_Lawal = {
        name        = "taiwo"
        create_user = true
      }
    }
  }

  Testers = {
    group_name = "Testers"

    attach_iam_self_management_policy = true
    iam_read_only_policy = {
      name                       = "ReadOnlyTesters"
      create_policy              = true
      path                       = "/"
      description                = "Developers read-only policy"
      allow_web_console_services = true
      web_console_services       = ["resource-groups", "tag", "health", "ce"]
    }

    iam_policy = {
      name          = "AllowCRUDTesters"
      create_policy = true
      path          = "/"
      description   = "Admin Access To Developers policy"
    }

    user = {
      user_name = {
        name                          = ""
        create_user                   = false
        create_iam_user_login_profile = false
      }
    }
  }

  Tools = {
    group_name = "Tools"

    attach_iam_self_management_policy = true
    iam_read_only_policy = {
      name                       = "ReadOnlyTools"
      create_policy              = false
      path                       = "/"
      description                = "Developers read-only policy"
      allow_web_console_services = true
      web_console_services       = ["resource-groups", "tag", "health", "ce"]
    }

    iam_policy = {
      name          = "AllowCRUDTools"
      create_policy = true
      path          = "/"
      description   = "Admin Access To Developers policy"
    }

    user = {
      Terraform = {
        name        = "terraform"
        create_user = true
      }
    }
  }
}


service_account_role = {
  vault_kms = {
    role_name   = "vaultKMS"
    create_role = true
    role_policy_arns = {
      AWSKeyManagementServicePowerUser = "arn:aws:iam::aws:policy/AWSKeyManagementServicePowerUser"
    }

    # oidc_providers = {
    #   one = {
    #     provider_arn               = module.eks.oidc_provider_arn
    #     namespace_service_accounts = ["vault:vault-kms", ]
    #   }
    # }

    tags = {
      Name = "Vault-KMS-Service-Account-Role"
    }
  }

  terraform = {
    role_name   = "terraform"
    create_role = true
    role_policy_arns = {
      AWSKeyManagementServicePowerUser = "arn:aws:iam::aws:policy/AdministratorAccess"
    }

    # oidc_providers = {
    #   one = {
    #     provider_arn               = module.eks.oidc_provider_arn
    #     namespace_service_accounts = ["gitlab-runner:runner", ]
    #   }
    # }

    tags = {
      Name = "Vault-KMS-Service-Account-Role"
    }
  }

  chartmuseum = {
    role_name   = "chartmuseum"
    create_role = true
    role_policy_arns = {
      chartmuseum-policy = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    }

    # oidc_providers = {
    #   one = {
    #     provider_arn               = module.eks.oidc_provider_arn
    #     namespace_service_accounts = ["sharedtooling:chartmuseum", ]
    #   }
    # }

    tags = {
      Name = "Chartmuseum-Service-Account-Role"
    }
  }
}


# ---------------------------------------
# Route53
# ---------------------------------------

zone_name = "green.darey.io"

record_ttl_for_ns = ""

zone_id_dns_account = "Z07640512QNYMCZT0F9AP"

route53_aliase_name = ""

route53_raliase_zone_id = ""

record_ttl = 300

route53_record_apex = []