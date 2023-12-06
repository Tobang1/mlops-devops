locals {

  ############ EKS ###########
  aws_auth_developers = [
    for developer in var.developer_usernames :
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${developer}"
      username = "${developer}"
      groups   = ["developers:${developer}"]
    }
  ]

  aws_auth_admins = [
    for admin in var.admin_usernames :
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${admin}"
      username = "${admin}"
      groups   = ["system:masters"]
    }
  ]

  namespaces = concat(var.developer_usernames, var.namespaces)

  aws_auth_roles = [
    for role in var.admin_roles :
    {
      rolearn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${role}"
      username = "${role}1"
      groups   = ["system:masters"]
    }
  ]
  ################################################################## 
  ############### Route53 Configuration ################
  /* additional_route_53_cname_record = {
    sonarqube = {
      name   = "sonarqube.tooling"
      record = [var.ingress_alb]
    },
    grafana = {
      name   = "grafana.tooling"
      record = [var.ingress_alb]
    },
    prometheus = {
      name   = "prometheus.tooling"
      record = [var.ingress_alb]
    }
    vault = {
      name   = "vault.tooling"
      record = ["af02508f8c76542fdae52b66f3f15b85-1392816194.eu-west-2.elb.amazonaws.com"]
    }
  } */
  ##################################################################


  ############### IAM Configuration ################
  # ReadOnly Permission Configuration
  developers_allowed_services = concat(
    ["ec2", "ecr", "eks", "ecs", "lambda", "autoscaling", "elasticloadbalancing"],
    ["vpc", "route53", "route53domains", "route53resolver", "servicediscovery"],
    ["s3", "backup", "dynamo", "dms", "elasticfilesystem"],
    ["rds", "dynamo", "elasticache"],
    ["cloudwatch", "events", "logs", "servicequotas", "ssm"],
    ["es", "firehose", "kinesis", "kinesisanalytics", "redshift"],
    ["ses", "sns", "sqs", "xray", "applicationinsights", "application-autoscaling"],
    ["iam", "acm", "kms", "secretsmanager"],
  )
  ##################################################################



  ############## IAM Groups Policy ##############
  group_policies = {
    Administrators = {
      policy = data.aws_iam_policy.AdministratorAccess.policy
    }
    Developers = {
      policy = data.aws_iam_policy.IAMSelfManageServiceSpecificCredentials.policy
    }
    Tools = {
      policy = data.aws_iam_policy.AdministratorAccess.policy
    }
    Testers = {
      policy = data.aws_iam_policy.IAMSelfManageServiceSpecificCredentials.policy
    }
  }
  ##################################################################

  ############## IAM Users ##############
  users = merge(var.Groups.Administrators.user, var.Groups.Developers.user, var.Groups.Tools.user)
  ##################################################################


  ############### IAM Configuration ################

  # ############### Usernames ################         Can be deleted if not needed
  # user_names          = [for k, v in local.users : v.name]
  # devops_usernames    = [for k, v in var.devops_users : v.name]
  # developer_usernames = [for k, v in var.developer_users : v.name]
  # tools_usernames     = [for k, v in var.tools : v.name]
  # tester_usernames    = [for k, v in var.testers : v.name]

  service_account_role_oidc_providers = {
    vault_kms = {
      one = {
        provider_arn               = module.eks.oidc_provider_arn
        namespace_service_accounts = ["vault:vault-kms", ]
      }
    }
    terraform = {
      one = {
        provider_arn               = module.eks.oidc_provider_arn
        namespace_service_accounts = ["gitlab-runner:runner", ]
      }
    }
    chartmuseum = {
      one = {
        provider_arn               = module.eks.oidc_provider_arn
        namespace_service_accounts = ["sharedtooling:chartmuseum", ]
      }
    }
  }
}