variable "description" {
  type = string
  default = " AWS KMS key managed my terraform"
}

variable "deletion_window_in_days" {
  type = number
  default = 30
}

variable "enable_key_rotation" {
  type = bool
  default = true
}

variable "is_enabled" {
  type = bool
  default = false
}

variable "key_usage" {
  type = string
  default = "ENCRYPT_DECRYPT"
}

variable "multi_region" {
  type = bool
  default = false
}

variable "enable_default_policy" {  
  type = bool
  default = true
}
variable "key_owners" {
  type = list
  default = []
}

variable "key_administrators" {
  type = list
  default = []
}

variable "key_users" {
  type = list
  default = []
}

variable "aliases" {
  type = list
  default = []
}

variable "aliases_use_name_prefix" {
  type = bool
  default = false
}

variable "grants" {
  type = map
  default = {}
}

variable "tags" {
  type = map
  default = {}
}