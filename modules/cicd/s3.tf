resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = var.cicd_artefacts_bucket_name
  acl    = "private"
} 