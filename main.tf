locals {
  buildspec_template = templatefile(var.buildspec_file, {
    STAGE_NAME      = var.environment
    REGION          = var.region
    NODE_ENV        = var.environment
    DISTRIBUTION_ID = var.cloudfront_distribution_id
    ROLE_ARN        = var.role_arn

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
    compute_type    = var.compute_type
    image           = var.image
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

  logs_config {
    cloudwatch_logs {
      group_name  = "${var.app_name}-log-group-${var.environment}"
      stream_name = "${var.app_name}-log-stream-${var.environment}"
    }

    s3_logs {
      status   = "ENABLED"
      location = "${var.s3_build_logs_bucket}/${var.environment}/${var.app_name}-build-logß"
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

}