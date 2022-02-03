terraform {
  required_version = "~> 1.0"
  backend "s3" {
    encrypt        = true
    bucket         = "s6-engineering-paul-demo-tfstate"
    key            = "terraform.tfstate"
    dynamodb_table = "s6-engineering-paul-demo--dynamodb-tfstate"
    region         = "ap-southeast-2"
    role_arn       = "arn:aws:iam::084661862211:role/OrganizationAccountAccessRole"
  }
}