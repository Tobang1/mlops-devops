variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "EKS cluster name"
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "EKS cluster version"
  default     = "1.25"
}

# variable "subnets" {
#   description = "List of subnets for the EKS cluster"
#   type        = list(string)
#   default     = ["subnet-12345678", "subnet-87654321"]
# }

# variable "vpc_id" {
#   description = "ID of the VPC where the EKS cluster will be created"
#   default     = "vpc-12345678"
# }

# variable "key_name" {
#   description = "Name of the SSH key pair"
#   default     = "my-keypair"
# }

variable "kubelet_extra_args" {
  description = "Extra arguments for kubelet"
  type        = map(string)
  default     = {}
}

variable "instance_type" {
  description = "Instance type for worker nodes"
  type = list(string)
  default     = ["t3.medium", "t3.large"]
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  default     = 2
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  default     = 3
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  default     = 1
}

variable "volume_size" {
  description = "Size of the worker node's root volume"
  default     = 20
}

variable "volume_type" {
  description = "Type of the worker node's root volume"
  default     = "gp2"
}
