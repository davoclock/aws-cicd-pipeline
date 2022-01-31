terraform {
    backend "s3" {
        encrypt = true
        bucket = var.tf_state_bucket_name
        key = var.tf_state_bucket_key
        dynamodb_table = "adms-nonprod-terraform-state-lock-dynamo"
        region = var.aws_region
    }

    required_version = ">= 0.14.9"

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.27"
        }
    }
}

provider "aws" {
    profile = var.aws_profile
    region = var.aws_region
}

module "cicd" {
    source = "./modules/cicd"

}

module "infrastructure" {
    source = "./modules/infrastructure"

}