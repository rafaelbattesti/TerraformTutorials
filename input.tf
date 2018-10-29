# Provide input to main.ts

variable "aws_key" {}
variable "aws_secret" {}

variable "aws_keypair" {
    default = "rbattesti"
}

variable "aws_region" {
    default = "us-east-1"
}
