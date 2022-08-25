## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_build_environment_variables"></a> [build\_environment\_variables](#input\_build\_environment\_variables) | list of environment vars | `list(map(string))` | `[]` | no |
| <a name="input_buildspec_file"></a> [buildspec\_file](#input\_buildspec\_file) | n/a | `string` | n/a | yes |
| <a name="input_cicd_crossaccount_role"></a> [cicd\_crossaccount\_role](#input\_cicd\_crossaccount\_role) | for crossaccount deployments | `string` | `""` | no |
| <a name="input_cicd_role"></a> [cicd\_role](#input\_cicd\_role) | cicd role | `string` | n/a | yes |
| <a name="input_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#input\_cloudfront\_distribution\_id) | n/a | `string` | `""` | no |
| <a name="input_compute_type"></a> [compute\_type](#input\_compute\_type) | n/a | `string` | `"BUILD_GENERAL1_MEDIUM"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | aws environment | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | n/a | `string` | `"aws/codebuild/amazonlinux2-x86_64-standard:4.0"` | no |
| <a name="input_pipeline_type"></a> [pipeline\_type](#input\_pipeline\_type) | pipeline type, e.g. lambda, frontend, etc. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | aws region | `string` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | cross account role for cloudfront cache invalidation | `string` | n/a | yes |
| <a name="input_s3_build_logs_bucket"></a> [s3\_build\_logs\_bucket](#input\_s3\_build\_logs\_bucket) | s3 bucket to store build logs | `string` | n/a | yes |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | vpc config | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_build_project_arn"></a> [build\_project\_arn](#output\_build\_project\_arn) | n/a |
| <a name="output_build_project_id"></a> [build\_project\_id](#output\_build\_project\_id) | n/a |
| <a name="output_build_project_name"></a> [build\_project\_name](#output\_build\_project\_name) | n/a |
