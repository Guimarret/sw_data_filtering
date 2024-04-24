data "aws_ecr_image" "lambda_image" {
  repository_name = "lambda_pipeline"
  image_tag       = var.image_tag
}