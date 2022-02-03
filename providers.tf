terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"

  assume_role {
    role_arn = var.env_role_arn
  }
}
