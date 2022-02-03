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

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "tf_codepipeline_role" {
  description = "AWS Codepipeline IAM role name"
  type        = string
  default     = "PaulDevOpsDemoTFCodePipeline"
}
variable "tf_codepipeline_policy" {
  description = "AWS Codepipeline policy name"
  type        = string
  default     = "PaulDevOpsDemoTFCodePipeline"
}

variable "tf_codebuild_role" {
  description = "AWS Codebuild role name"
  type        = string
  default     = "PaulDevOpsDemoTFCodeBuild"
}

variable "tf_codebuild_policy" {
  description = "AWS Codebuild policy name"
  type        = string
  default     = "PaulDevOpsDemoTFCodeBuildPolicy"
}

variable "dockerhub_credentials" {
  type    = string
  default = "arn:aws:secretsmanager:ap-southeast-2:084661862211:secret:paul-demo-codebuild/dockerhub-8btfY9"
}

variable "codestar_connector_credentials" {
  type    = string
  default = "arn:aws:codestar-connections:ap-southeast-2:084661862211:connection/bee1c39b-cc20-462f-b6b8-dd14ee644305"
}

variable "git_repo_id" {
  type    = string
  default = "pfilippov/aws-cicd-pipeline"
}

variable "cicd_artefacts_bucket_name" {
  description = "AWS S3 bucket name for CICD artefacts"
  type        = string
  default     = "s6-engineering-paul-demo-code-pipeline-artifacts"
}
