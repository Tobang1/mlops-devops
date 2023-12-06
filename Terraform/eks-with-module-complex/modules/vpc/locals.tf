# locals {
#   amazon_side_asn = {
#     for k, v in var.config :
#     k => lookup(v, "amazon_side_asn", "64512")
#   }

#   assign_ipv6_address_on_creation = {
#     for k, v in var.config :
#     k => lookup(v, "assign_ipv6_address_on_creation", false)
#   }

#   azs = {
#     for k, v in var.config :
#     k => lookup(v, "azs", [])
#   }

#   cidr = {
#     for k, v in var.config :
#     k => lookup(v, "cidr", "")
#   }

#   create_database_internet_gateway_route = {
#     for k, v in var.config :
#     k => lookup(v, "create_database_internet_gateway_route", false)
#   }

#   create_database_nat_gateway_route = {
#     for k, v in var.config :
#     k => lookup(v, "create_database_nat_gateway_route", false)
#   }

#   create_database_subnet_group = {
#     for k, v in var.config :
#     k => lookup(v, "create_database_subnet_group", true)
#   }

#   create_database_subnet_route_table = {
#     for k, v in var.config :
#     k => lookup(v, "create_database_subnet_route_table", false)
#   }

#   create_egress_only_igw = {
#     for k, v in var.config :
#     k => lookup(v, "create_egress_only_igw", true)
#   }

#   create_elasticache_subnet_group = {
#     for k, v in var.config :
#     k => lookup(v, "create_elasticache_subnet_group", true)
#   }

#   create_elasticache_subnet_route_table = {
#     for k, v in var.config :
#     k => lookup(v, "create_elasticache_subnet_route_table", false)
#   }

#   create_flow_log_cloudwatch_iam_role = {
#     for k, v in var.config :
#     k => lookup(v, "create_flow_log_cloudwatch_iam_role", false)
#   }

#   create_flow_log_cloudwatch_log_group = {
#     for k, v in var.config :
#     k => lookup(v, "create_flow_log_cloudwatch_log_group", false)
#   }

#   create_igw = {
#     for k, v in var.config :
#     k => lookup(v, "create_igw", true)
#   }

#   create_redshift_subnet_group = {
#     for k, v in var.config :
#     k => lookup(v, "create_redshift_subnet_group", true)
#   }

#   create_redshift_subnet_route_table = {
#     for k, v in var.config :
#     k => lookup(v, "create_redshift_subnet_route_table", false)
#   }

#   create_vpc = {
#     for k, v in var.config :
#     k => lookup(v, "create_vpc", true)
#   }

#   customer_gateway_tags = {
#     for k, v in var.config :
#     k => lookup(v, "customer_gateway_tags", {})
#   }

#   customer_gateways = {
#     for k, v in var.config :
#     k => lookup(v, "customer_gateways", {})
#   }

#   database_acl_tags = {
#     for k, v in var.config :
#     k => lookup(v, "database_acl_tags", {})
#   }

#   database_dedicated_network_acl = {
#     for k, v in var.config :
#     k => lookup(v, "database_dedicated_network_acl", false)
#   }

#   database_inbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "database_inbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]
#     )
#   }

#   database_outbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "database_outbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]

#     )
#   }

#   database_route_table_tags = {
#     for k, v in var.config :
#     k => lookup(v, "database_route_table_tags", {})
#   }

#   database_subnet_assign_ipv6_address_on_creation = {
#     for k, v in var.config :
#     k => lookup(v, "database_subnet_assign_ipv6_address_on_creation", null)
#   }

#   database_subnet_group_name = {
#     for k, v in var.config :
#     k => lookup(v, "database_subnet_group_name", "default")
#   }

#   database_subnet_group_tags = {
#     for k, v in var.config :
#     k => lookup(v, "database_subnet_group_tags", {})
#   }


#   database_subnet_suffix = {
#     for k, v in var.config :
#     k => lookup(v, "database_subnet_suffix", "db")
#   }

#   database_subnet_tags = {
#     for k, v in var.config :
#     k => lookup(v, "database_subnet_tags", {})
#   }

#   database_subnets = {
#     for k, v in var.config :
#     k => lookup(v, "database_subnets", [])
#   }

#   default_network_acl_egress = {
#     for k, v in var.config :
#     k => lookup(v, "default_network_acl_egress",
#       [
#         {
#           rule_no    = 100
#           action     = "allow"
#           from_port  = 0
#           to_port    = 0
#           protocol   = "-1"
#           cidr_block = "0.0.0.0/0"
#         },
#         {
#           rule_no         = 101
#           action          = "allow"
#           from_port       = 0
#           to_port         = 0
#           protocol        = "-1"
#           ipv6_cidr_block = "::/0"
#         },
#       ]

#     )
#   }

#   default_network_acl_ingress = {
#     for k, v in var.config :
#     k => lookup(v, "default_network_acl_ingress",
#       [
#         {
#           rule_no    = 100
#           action     = "allow"
#           from_port  = 0
#           to_port    = 0
#           protocol   = "-1"
#           cidr_block = "0.0.0.0/0"
#         },
#         {
#           rule_no         = 101
#           action          = "allow"
#           from_port       = 0
#           to_port         = 0
#           protocol        = "-1"
#           ipv6_cidr_block = "::/0"
#         },
#       ]

#     )
#   }

#   default_network_acl_name = {
#     for k, v in var.config :
#     k => lookup(v, "default_network_acl_name", "")
#   }

#   default_network_acl_tags = {
#     for k, v in var.config :
#     k => lookup(v, "default_network_acl_tags", {})
#   }

#   default_route_table_propagating_vgws = {
#     for k, v in var.config :
#     k => lookup(v, "default_route_table_propagating_vgws", [])
#   }

#   default_route_table_routes = {
#     for k, v in var.config :
#     k => lookup(v, "default_route_table_routes", [])
#   }

#   default_route_table_tags = {
#     for k, v in var.config :
#     k => lookup(v, "default_route_table_tags", {})
#   }

#   default_security_group_egress = {
#     for k, v in var.config :
#     k => lookup(v, "default_security_group_egress", [])
#   }

#   default_security_group_ingress = {
#     for k, v in var.config :
#     k => lookup(v, "default_security_group_ingress", [])
#   }

#   default_security_group_name = {
#     for k, v in var.config :
#     k => lookup(v, "default_security_group_name", "")
#   }

#   default_security_group_tags = {
#     for k, v in var.config :
#     k => lookup(v, "default_security_group_tags", {})
#   }

#   default_vpc_enable_classiclink = {
#     for k, v in var.config :
#     k => lookup(v, "default_vpc_enable_classiclink", false)
#   }

#   default_vpc_enable_dns_hostnames = {
#     for k, v in var.config :
#     k => lookup(v, "default_vpc_enable_dns_hostnames", false)
#   }

#   default_vpc_enable_dns_support = {
#     for k, v in var.config :
#     k => lookup(v, "default_vpc_enable_dns_support", true)
#   }

#   default_vpc_name = {
#     for k, v in var.config :
#     k => lookup(v, "default_vpc_name", "")
#   }

#   default_vpc_tags = {
#     for k, v in var.config :
#     k => lookup(v, "default_vpc_tags", {})
#   }

#   dhcp_options_domain_name = {
#     for k, v in var.config :
#     k => lookup(v, "dhcp_options_domain_name", "")
#   }

#   dhcp_options_domain_name_servers = {
#     for k, v in var.config :
#     k => lookup(v, "dhcp_options_domain_name_servers", ["AmazonProvidedDNS"])
#   }

#   dhcp_options_netbios_name_servers = {
#     for k, v in var.config :
#     k => lookup(v, "dhcp_options_netbios_name_servers", [])
#   }

#   dhcp_options_netbios_node_type = {
#     for k, v in var.config :
#     k => lookup(v, "dhcp_options_netbios_node_type", "")
#   }

#   dhcp_options_ntp_servers = {
#     for k, v in var.config :
#     k => lookup(v, "dhcp_options_ntp_servers", [])
#   }

#   dhcp_options_tags = {
#     for k, v in var.config :
#     k => lookup(v, "dhcp_options_tags", {})
#   }

#   elasticache_outbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "elasticache_outbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#     ])
#   }

#   elasticache_acl_tags = {
#     for k, v in var.config :
#     k => lookup(v, "elasticache_acl_tags", {})
#   }

#   elasticache_dedicated_network_acl = {
#     for k, v in var.config :
#     k => lookup(v, "elasticache_dedicated_network_acl", false)
#   }

#   elasticache_inbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "elasticache_inbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]

#     )
#   }

#   elasticache_route_table_tags = {
#     for k, v in var.config :
#     k => lookup(v, "elasticache_route_table_tags", {})
#   }

#   elasticache_subnet_assign_ipv6_address_on_creation = {
#     for k, v in var.config :
#     k => lookup(v, "elasticache_subnet_assign_ipv6_address_on_creation", false)
#   }

#   elasticache_subnet_group_name = {
#     for k, v in var.config :
#     k => lookup(v, "elasticache_subnet_group_name", "")
#   }

#   elasticache_subnet_group_tags = {
#     for k, v in var.config :
#     k => lookup(v, "elasticache_subnet_group_tags", {})
#   }

#   elasticache_subnet_ipv6_prefixes = {
#     for k, v in var.config :
#     k => lookup(v, "elasticache_subnet_ipv6_prefixes", [])
#   }

#   elasticache_subnet_suffix = {
#     for k, v in var.config :
#     k => lookup(v, "elasticache_subnet_suffix", "elasticache")
#   }

#   elasticache_subnet_tags = {
#     for k, v in var.config :
#     k => lookup(v, "elasticache_subnet_tags", {})
#   }

#   elasticache_subnets = {
#     for k, v in var.config :
#     k => lookup(v, "elasticache_subnets", [])
#   }

#   enable_classiclink = {
#     for k, v in var.config :
#     k => lookup(v, "enable_classiclink", false)
#   }

#   enable_classiclink_dns_support = {
#     for k, v in var.config :
#     k => lookup(v, "enable_classiclink_dns_support", false)
#   }

#   enable_dhcp_options = {
#     for k, v in var.config :
#     k => lookup(v, "enable_dhcp_options", false)
#   }


#   enable_dns_hostnames = {
#     for k, v in var.config :
#     k => lookup(v, "enable_dns_hostnames", false)
#   }

#   enable_dns_support = {
#     for k, v in var.config :
#     k => lookup(v, "enable_dns_support", true)
#   }

#   enable_flow_log = {
#     for k, v in var.config :
#     k => lookup(v, "enable_flow_log", false)
#   }

#   enable_ipv6 = {
#     for k, v in var.config :
#     k => lookup(v, "enable_ipv6_Requests", false)
#   }

#   enable_nat_gateway = {
#     for k, v in var.config :
#     k => lookup(v, "enable_nat_gateway", false)
#   }

#   enable_public_redshift = {
#     for k, v in var.config :
#     k => lookup(v, "enable_public_redshift", false)
#   }

#   enable_vpn_gateway = {
#     for k, v in var.config :
#     k => lookup(v, "enable_vpn_gateway", false)
#   }

#   external_nat_ip_ids = {
#     for k, v in var.config :
#     k => lookup(v, "external_nat_ip_ids", [])
#   }

#   external_nat_ips = {
#     for k, v in var.config :
#     k => lookup(v, "external_nat_ips", [])
#   }

#   flow_log_cloudwatch_iam_role_arn = {
#     for k, v in var.config :
#     k => lookup(v, "flow_log_cloudwatch_iam_role_arn", "")
#   }

#   flow_log_cloudwatch_log_group_kms_key_id = {
#     for k, v in var.config :
#     k => lookup(v, "flow_log_cloudwatch_log_group_kms_key_id", "")
#   }

#   flow_log_cloudwatch_log_group_name_prefix = {
#     for k, v in var.config :
#     k => lookup(v, "flow_log_cloudwatch_log_group_name_prefix", "/aws/vpc-flow-log/")
#   }

#   flow_log_cloudwatch_log_group_retention_in_days = {
#     for k, v in var.config :
#     k => lookup(v, "flow_log_cloudwatch_log_group_retention_in_days", 30)
#   }

#   flow_log_destination_arn = {
#     for k, v in var.config :
#     k => lookup(v, "flow_log_destination_arn", "")
#   }

#   flow_log_destination_type = {
#     for k, v in var.config :
#     k => lookup(v, "flow_log_destination_type", "cloud-watch-logs")
#   }

#   flow_log_file_format = {
#     for k, v in var.config :
#     k => lookup(v, "flow_log_file_format", "plain-text")
#   }

#   flow_log_hive_compatible_partitions = {
#     for k, v in var.config :
#     k => lookup(v, "flow_log_hive_compatible_partitions", false)
#   }
#   flow_log_log_format = {
#     for k, v in var.config :
#     k => lookup(v, "flow_log_log_format", "")
#   }

#   flow_log_max_aggregation_interval = {
#     for k, v in var.config :
#     k => lookup(v, "flow_log_max_aggregation_interval", 600)
#   }

#   flow_log_per_hour_partition = {
#     for k, v in var.config :
#     k => lookup(v, "flow_log_per_hour_partition", false)
#   }

#   flow_log_traffic_type = {
#     for k, v in var.config :
#     k => lookup(v, "flow_log_traffic_type", "ALL")
#   }

#   igw_tags = {
#     for k, v in var.config :
#     k => lookup(v, "igw_tags", {})
#   }

#   instance_tenancy = {
#     for k, v in var.config :
#     k => lookup(v, "instance_tenancy", "default")
#   }

#   intra_acl_tags = {
#     for k, v in var.config :
#     k => lookup(v, "intra_acl_tags", {})
#   }

#   intra_dedicated_network_acl = {
#     for k, v in var.config :
#     k => lookup(v, "intra_dedicated_network_acl", false)
#   }

#   intra_inbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "intra_inbound_acl_rules ",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]
#     )
#   }

#   intra_outbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "intra_outbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]

#     )
#   }

#   intra_route_table_tags = {
#     for k, v in var.config :
#     k => lookup(v, "intra_route_table_tags", {})
#   }

#   intra_subnet_assign_ipv6_address_on_creation = {
#     for k, v in var.config :
#     k => lookup(v, "intra_subnet_assign_ipv6_address_on_creation", null)
#   }

#   intra_subnet_ipv6_prefixes = {
#     for k, v in var.config :
#     k => lookup(v, "intra_subnet_ipv6_prefixes", [])
#   }

#   intra_subnet_suffix = {
#     for k, v in var.config :
#     k => lookup(v, "intra_subnet_suffix", "intra")
#   }

#   intra_subnet_tags = {
#     for k, v in var.config :
#     k => lookup(v, "intra_subnet_tags  ", {})
#   }

#   intra_subnets = {
#     for k, v in var.config :
#     k => lookup(v, "intra_subnets", [])
#   }

#   manage_default_network_acl = {
#     for k, v in var.config :
#     k => lookup(v, "manage_default_network_acl", false)
#   }

#   manage_default_route_table = {
#     for k, v in var.config :
#     k => lookup(v, "manage_default_route_table", false)
#   }

#   manage_default_security_group = {
#     for k, v in var.config :
#     k => lookup(v, "manage_default_security_group", true)
#   }

#   manage_default_vpc = {
#     for k, v in var.config :
#     k => lookup(v, "manage_default_vpc", false)
#   }

#   map_public_ip_on_launch = {
#     for k, v in var.config :
#     k => lookup(v, "map_public_ip_on_launch", false)
#   }


#   name = {
#     for k, v in var.config :
#     k => lookup(v, "name", "vpc-${var.environment}")
#   }

#   nat_eip_tags = {
#     for k, v in var.config :
#     k => lookup(v, "nat_eip_tags", {})
#   }


#   nat_gateway_destination_cidr_block = {
#     for k, v in var.config :
#     k => lookup(v, "nat_gateway_destination_cidr_block", "0.0.0.0/0")
#   }


#   nat_gateway_tags = {
#     for k, v in var.config :
#     k => lookup(v, "nat_gateway_tags", {})
#   }


#   one_nat_gateway_per_az = {
#     for k, v in var.config :
#     k => lookup(v, "one_nat_gateway_per_az", false)
#   }


#   outpost_acl_tags = {
#     for k, v in var.config :
#     k => lookup(v, "outpost_acl_tags", {})
#   }


#   outpost_arn = {
#     for k, v in var.config :
#     k => lookup(v, "outpost_arn", "")
#   }


#   outpost_az = {
#     for k, v in var.config :
#     k => lookup(v, "outpost_az", "")
#   }


#   outpost_dedicated_network_acl = {
#     for k, v in var.config :
#     k => lookup(v, "outpost_dedicated_network_acl", false)
#   }


#   outpost_inbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "outpost_inbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]
#     )
#   }


#   outpost_outbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "outpost_outbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]

#     )
#   }


#   outpost_subnet_assign_ipv6_address_on_creation = {
#     for k, v in var.config :
#     k => lookup(v, "outpost_subnet_assign_ipv6_address_on_creation", null)
#   }


#   outpost_subnet_ipv6_prefixes = {
#     for k, v in var.config :
#     k => lookup(v, "outpost_subnet_ipv6_prefixes ", [])
#   }


#   outpost_subnet_suffix = {
#     for k, v in var.config :
#     k => lookup(v, "outpost_subnet_suffix", "outpost")
#   }


#   outpost_subnet_tags = {
#     for k, v in var.config :
#     k => lookup(v, "outpost_subnet_tags", {})
#   }


#   outpost_subnets = {
#     for k, v in var.config :
#     k => lookup(v, "outpost_subnets", [])
#   }


#   private_acl_tags = {
#     for k, v in var.config :
#     k => lookup(v, "private_acl_tags", {})
#   }


#   private_dedicated_network_acl = {
#     for k, v in var.config :
#     k => lookup(v, "private_dedicated_network_acl", false)
#   }


#   private_inbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "private_inbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]
#     )
#   }


#   private_outbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "private_outbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]
#     )
#   }


#   private_route_table_tags = {
#     for k, v in var.config :
#     k => lookup(v, "private_route_table_tags", {})
#   }

#   private_subnet_assign_ipv6_address_on_creation = {
#     for k, v in var.config :
#     k => lookup(v, "private_subnet_assign_ipv6_address_on_creation", false)
#   }


#   private_subnet_ipv6_prefixes = {
#     for k, v in var.config :
#     k => lookup(v, "private_subnet_ipv6_prefixes", [])
#   }


#   private_subnet_suffix = {
#     for k, v in var.config :
#     k => lookup(v, "private_subnet_suffix", "private")
#   }


#   private_subnet_tags = {
#     for k, v in var.config :
#     k => lookup(v, "private_subnet_tags", {})
#   }


#   private_subnets = {
#     for k, v in var.config :
#     k => lookup(v, "private_subnets", [])
#   }


#   propagate_intra_route_tables_vgw = {
#     for k, v in var.config :
#     k => lookup(v, "propagate_intra_route_tables_vgw ", false)
#   }

#   propagate_private_route_tables_vgw = {
#     for k, v in var.config :
#     k => lookup(v, "propagate_private_route_tables_vgw", false)
#   }

#   propagate_public_route_tables_vgw = {
#     for k, v in var.config :
#     k => lookup(v, "propagate_public_route_tables_vgw", false)
#   }

#   public_acl_tags = {
#     for k, v in var.config :
#     k => lookup(v, "public_acl_tags", {})
#   }

#   public_dedicated_network_acl = {
#     for k, v in var.config :
#     k => lookup(v, "public_dedicated_network_acl", false)
#   }

#   public_inbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "public_inbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]

#     )
#   }

#   public_outbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "public_outbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]

#     )
#   }

#   public_route_table_tags = {
#     for k, v in var.config :
#     k => lookup(v, "public_route_table_tags", {})
#   }

#   public_subnet_assign_ipv6_address_on_creation = {
#     for k, v in var.config :
#     k => lookup(v, "public_subnet_assign_ipv6_address_on_creation", false)
#   }

#   public_subnet_ipv6_prefixes = {
#     for k, v in var.config :
#     k => lookup(v, "public_subnet_ipv6_prefixes", [])
#   }

#   public_subnet_suffix = {
#     for k, v in var.config :
#     k => lookup(v, "public_subnet_suffix", "public")
#   }

#   public_subnet_tags = {
#     for k, v in var.config :
#     k => lookup(v, "public_subnet_tags ", {})
#   }


#   public_subnets = {
#     for k, v in var.config :
#     k => lookup(v, "public_subnets", [])
#   }

#   redshift_acl_tags = {
#     for k, v in var.config :
#     k => lookup(v, "redshift_acl_tags", {})
#   }

#   redshift_dedicated_network_acl = {
#     for k, v in var.config :
#     k => lookup(v, "redshift_dedicated_network_acl ", false)
#   }


#   redshift_inbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "redshift_inbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]

#     )
#   }


#   redshift_outbound_acl_rules = {
#     for k, v in var.config :
#     k => lookup(v, "redshift_outbound_acl_rules",
#       [
#         {
#           rule_number = 100
#           rule_action = "allow"
#           from_port   = 0
#           to_port     = 0
#           protocol    = "-1"
#           cidr_block  = "0.0.0.0/0"
#         },
#       ]
#     )
#   }

#   redshift_route_table_tags = {
#     for k, v in var.config :
#     k => lookup(v, "redshift_route_table_tags", {})
#   }

#   redshift_subnet_assign_ipv6_address_on_creation = {
#     for k, v in var.config :
#     k => lookup(v, "redshift_subnet_assign_ipv6_address_on_creation", null)
#   }

#   redshift_subnet_group_name = {
#     for k, v in var.config :
#     k => lookup(v, "azredshift_subnet_group_names", "")
#   }

#   redshift_subnet_group_tags = {
#     for k, v in var.config :
#     k => lookup(v, "redshift_subnet_group_tags", {})
#   }

#   redshift_subnet_ipv6_prefixes = {
#     for k, v in var.config :
#     k => lookup(v, "redshift_subnet_ipv6_prefixes", [])
#   }

#   redshift_subnet_suffix = {
#     for k, v in var.config :
#     k => lookup(v, "redshift_subnet_suffix", "redshift")
#   }

#   redshift_subnet_tags = {
#     for k, v in var.config :
#     k => lookup(v, "redshift_subnet_tags", {})
#   }

#   redshift_subnets = {
#     for k, v in var.config :
#     k => lookup(v, "redshift_subnets", [])
#   }

#   reuse_nat_ips = {
#     for k, v in var.config :
#     k => lookup(v, "reuse_nat_ips", false)
#   }

#   secondary_cidr_blocks = {
#     for k, v in var.config :
#     k => lookup(v, "secondary_cidr_blocks", [])
#   }

#   single_nat_gateway = {
#     for k, v in var.config :
#     k => lookup(v, "single_nat_gateway", false)
#   }

#   tags = {
#     for k, v in var.config :
#     k => lookup(v, "tags", {})
#   }

#   vpc_flow_log_permissions_boundary = {
#     for k, v in var.config :
#     k => lookup(v, "vpc_flow_log_permissions_boundary", "")
#   }

#   vpc_flow_log_tags = {
#     for k, v in var.config :
#     k => lookup(v, "vpc_flow_log_tags", {})
#   }

#   vpc_tags = {
#     for k, v in var.config :
#     k => lookup(v, "vpc_tags", {})
#   }

#   vpn_gateway_az = {
#     for k, v in var.config :
#     k => lookup(v, "vpn_gateway_az", "")
#   }

#   vpn_gateway_id = {
#     for k, v in var.config :
#     k => lookup(v, "vpn_gateway_id", "")
#   }

#   vpn_gateway_tags = {
#     for k, v in var.config :
#     k => lookup(v, "vpn_gateway_tags", {})
#   }
# }