variable "name" {
  type = string
  default = "demopolicy"
}

variable "create_policy" {
  type = bool
  default = false
}

variable "path" {
  type = string
  default = "/"
}

variable "description" {
  type = string
  default = ""
}

variable "policy" {
  type = any
  default = []
}