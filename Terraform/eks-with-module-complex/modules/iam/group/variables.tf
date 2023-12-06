variable "name" {
  type = string
  default = "demo-group"
}

variable "group_users" {
  type = list
  default = []
}

variable "attach_iam_self_management_policy" {
  type = bool
  default = false
}

variable "iam_read_only_policy_name" {
  type = string
  default = "demo-read-only-policy"
}

variable "iam_read_only_policy_create_policy" {
  type = bool
  default = false
}

variable "iam_read_only_policy_path" {
  type = string
  default = "/"
}

variable "iam_read_only_policy_description" {
  type = string
  default = ""
}

variable "iam_read_only_policy_allow_web_console_services" {
  type = bool
  default = false
}

variable "iam_read_only_policy_allowed_services" {
  type = any
  default = []
}

variable "iam_read_only_policy_web_console_services" {
  type = list
  default = ["resource-groups", "tag", "health", "ce"]
}

variable "iam_policy_name" {
  type = string
  default = "demopolicy"
}

variable "iam_policy_create_policy" {
  type = bool
  default = false
}

variable "iam_policy_path" {
  type = string
  default = "/"
}

variable "iam_policy_description" {
  type = string
  default = ""
}

variable "iam_policy_policy" {
  type = any
  default = []
}