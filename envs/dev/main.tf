module "cicd" {
  source = "../../modules/cicd"

  aws_region                     = var.aws_region
  git_repo_id                    = var.git_repo_id
  tf_codepipeline_policy         = var.tf_codepipeline_policy
  tf_codepipeline_role           = var.tf_codepipeline_role
  tf_codebuild_role              = var.tf_codebuild_role
  tf_codebuild_policy            = var.tf_codebuild_policy
  dockerhub_credentials          = var.dockerhub_credentials
  codestar_connector_credentials = var.codestar_connector_credentials
  cicd_artefacts_bucket_name     = var.cicd_artefacts_bucket_name
  application_name               = var.application_name
  environment                    = var.environment
  tags                           = var.tags
}

module "infrastructure" {
  source = "../../modules/infrastructure"

  aws_region       = var.aws_region
  application_name = var.application_name
  environment      = var.environment
  tags             = var.tags
}