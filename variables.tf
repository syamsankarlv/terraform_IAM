variable "aws_region" {}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "username" {
  type    = list(string)
  default = ["sankar", "basil", "mohit"]
}