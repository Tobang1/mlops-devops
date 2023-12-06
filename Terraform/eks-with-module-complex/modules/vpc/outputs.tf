# output "config" {
#   value = {
#     for k, v in var.config :
#     k => {
#       vpc_id          = module.vpc[k].vpc_id
#       private_subnets = module.vpc[k].private_subnets
#       public_subnets  = module.vpc[k].public_subnets
#     }
#   }
# }
output "vpc_id" {
    value = module.vpc.vpc_id
}

output "private_subnets" {
    value = module.vpc.private_subnets
}

output "public_subnets" {
    value = module.vpc.public_subnets
}

