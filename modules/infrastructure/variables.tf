variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "application_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "tags" {
  type = object({
    costgroup = string
  })
}