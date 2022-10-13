terraform{
    backend "s3" {
        bucket = "ap-south-1-aws-cicd-pipeline"
        encrypt = true
        key = "terraform.tfstate"
        region = "ap-south-1"
    }
}

provider "aws" {
    region = "ap-south-1"
}
