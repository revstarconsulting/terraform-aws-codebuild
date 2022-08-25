locals {
  buildspec_template = templatefile(var.buildspec_file, {
    STAGE_NAME      = var.environment
    REGION          = var.region
    NODE_ENV        = var.environment
    DISTRIBUTION_ID = var.cloudfront_distribution_id

  })
}

resource "aws_codebuild_project" "this" {
  name          = "${var.project_name}-codebuild-${var.pipeline_type}-${var.environment}"
  build_timeout = "10"
  service_role  = var.cicd_role

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_MEDIUM"
    image           = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    dynamic "environment_variable" {
      for_each = concat(var.build_environment_variables)

      content {
        name  = environment_variable.value.name
        value = environment_variable.value.value
      }
    }


  }

  dynamic "vpc_config" {
    for_each = var.vpc_config

    content {
      vpc_id             = lookup(vpc_config.value, "vpc_id", null)
      subnets            = lookup(vpc_config.value, "private_subnets", null)
      security_group_ids = lookup(vpc_config.value, "security_group_id", null)
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = local.buildspec_template
  }
  # lifecycle {
  #     ignore_changes = all
  # }
}