resource "aws_iam_role" "tf_codepipeline_role" {
  name = var.tf_codepipeline_role

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

data "aws_iam_policy_document" "tf_cicd_pipeline_policies" {
    statement{
        sid = ""
        actions = ["codestar-connections:UseConnection"]
        resources = ["*"]
        effect = "Allow"
    }
    statement{
        sid = ""
        actions = ["cloudwatch:*", "s3:*", "codebuild:*"]
        resources = ["*"]
        effect = "Allow"
    }
}

resource "aws_iam_policy" "tf_cicd_pipeline_policy" {
    name = var.tf_pipeline_policy
    path = "/"
    description = "Pipeline policy"
    policy = data.aws_iam_policy_document.tf_cicd_pipeline_policies.json
}

resource "aws_iam_role_policy_attachment" "tf-cicd-pipeline-attachment" {
    policy_arn = aws_iam_policy.tf_cicd_pipeline_policy.arn
    role = aws_iam_role.tf_codepipeline_role.id
}


resource "aws_iam_role" "tf_codebuild_role" {
  name = var.tf_codebuild_role

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

data "aws_iam_policy_document" "tf_cicd_build_policies" {
    statement{
        sid = ""
        actions = ["logs:*", "s3:*", "codebuild:*", "secretsmanager:*","iam:*"]
        resources = ["*"]
        effect = "Allow"
    }
}

resource "aws_iam_policy" "tf_cicd_build_policy" {
    name = var.tf_codebuild_policy
    path = "/"
    description = "Codebuild policy"
    policy = data.aws_iam_policy_document.tf_cicd_build_policies.json
}

resource "aws_iam_role_policy_attachment" "tf_cicd_codebuild_attachment1" {
    policy_arn  = aws_iam_policy.tf_cicd_build_policy.arn
    role        = aws_iam_role.tf_codebuild_role.id
}

resource "aws_iam_role_policy_attachment" "tf_cicd_codebuild_attachment2" {
    policy_arn  = "arn:aws:iam::aws:policy/PowerUserAccess"
    role        = aws_iam_role.tf_codebuild_role.id
}