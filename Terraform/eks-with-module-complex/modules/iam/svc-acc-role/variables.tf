variable "role_name" {
    type = string
    default = "demo-role"
}

variable "create_role" {
    type = bool
    default = false
}

variable "role_policy_arns" {
    type = map
    default = {}
}

variable "oidc_providers" {
    type = map
    default = {}
}

variable "tags" {
    type = map
    default = {}
}
