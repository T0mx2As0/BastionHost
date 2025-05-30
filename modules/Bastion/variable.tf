data "aws_vpc" "vpc" {
    default = true
}

data "aws_ssm_parameter" "ami" {
  name = "image-ami"
}

variable "instance_type" {
  type = string
}

variable "user" {
  type = string
  sensitive = true
}

data "aws_iam_access_keys" "Personal" {
    user = var.user
}

variable "key_name" {
  type = string
}

data "aws_subnet" "PublicSub1" {
  filter {
    name = "tag:Name"
    values = ["PublicSub1"]
  }
}