output "build_project_name" {
  value = aws_codebuild_project.this.name
}

output "build_project_arn" {
  value = aws_codebuild_project.this.arn
}

output "build_project_id" {
  value = aws_codebuild_project.this.id
}