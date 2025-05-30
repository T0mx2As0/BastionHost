variable "key_name" {
  type = string
}

variable "user" {
  type = string
  sensitive = true
}

variable "instance_type" {
  type = string
}