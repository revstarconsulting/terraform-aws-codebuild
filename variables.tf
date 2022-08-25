variable "environment" {
  type        = string
  description = "aws environment"
}

variable "region" {
  type        = string
  description = "aws region"
}

variable "project_name" {
  type = string
}

variable "cloudfront_distribution_id" {
  type    = string
  default = ""
}

variable "cicd_role" {
  type        = string
  description = "cicd role"
}

variable "cicd_crossaccount_role" {
  type        = string
  description = "for crossaccount deployments"
  default     = ""
}

variable "build_environment_variables" {
  type        = list(map(string))
  description = "list of environment vars"
  default     = []
}

variable "pipeline_type" {
  type        = string
  description = "pipeline type, e.g. lambda, frontend, etc."
}

variable "vpc_config" {
  type        = any
  description = "vpc config"
  default     = {}
}

variable "buildspec_file" {
  type = string
}