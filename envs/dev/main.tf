module "cicd" {
  source = "../../modules/cicd"

  tf_codepipeline_role           = var.tf_codepipeline_role
  tf_pipeline_policy             = var.tf_codepipeline_policy
  tf_codebuild_role              = var.tf_codebuild_role
  tf_codebuild_policy            = var.tf_codebuild_policy
  dockerhub_credentials          = var.dockerhub_credentials
  codestar_connector_credentials = var.codestar_connector_credentials
  cicd_artefacts_bucket_name     = var.cicd_artefacts_bucket_name
}

module "infrastructure" {
  source = "../../modules/infrastructure"

}