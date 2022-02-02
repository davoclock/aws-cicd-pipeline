variable "aws_profile" {
  description = "AWS profile"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "tf_state_bucket_name" {
  description = "AWS S3 bucket name for keeping TF state"
  type        = string
}

variable "tf_state_bucket_key" {
  description = "AWS S3 bucket key for keeping TF state"
  type        = string
}

variable "tf_state_dynamodb_table" {
  description = "AWS DynamoDB table for keeping TF state"
  type        = string
}

variable "dockerhub_credentials" {
  type = string
}

variable "codestar_connector_credentials" {
  type = string
}

variable "git-repo-id" {
  description = "Full Github repository id"
  type        = string
}

variable "tf_codepipeline_role" {
  description = "AWS Codepipeline IAM role name"
  type        = string
}

variable "tf_codepipeline_policy" {
  description = "AWS Codepipeline policy name"
  type        = string
}

variable "tf_codebuild_role" {
  description = "AWS Codebuild role name"
  type        = string
}

variable "tf_codebuild_policy" {
  description = "AWS Codebuild policy name"
  type        = string
}

variable "cicd_artefacts_bucket_name" {
  description = "AWS S3 bucket name for CICD artefacts"
  type        = string
}

