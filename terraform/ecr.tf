resource "aws_ecr_repository" "lambda_image" {
  name                 = "lambda_pipeline"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}