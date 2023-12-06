variable "name" {
  type = string
  default = "demosg"
}

variable "description" {
  type = string
  default = "Please add a description to this security group"
}

variable "vpc_id" {
  type = string
  default = ""
}

variable "create" {
  type = bool
  default = false
}

variable "security_group_id" {
  type = string
  default = ""
  description = "ID of existing security group whose rules terraform will manage"
}

variable "ingress_cidr_blocks" {
  type = any
  default = []
}

variable "ingress_rules" {
  type = any
  default = []
}

variable "ingress_with_cidr_blocks" {
  type = any
  default = []
}

variable "egress_with_cidr_blocks" {
  type = any
  default = []
}

variable "egress_cidr_blocks" {
  type = any
  default = []
}

variable "egress_rules" {
  type = any
  default = []
}
