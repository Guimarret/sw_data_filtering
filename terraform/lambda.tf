resource "aws_lambda_function" "lambda_pipeline_sw" {
  function_name = "lambda_pipeline_sw"
  timeout       = 300
  image_uri     = data.aws_ecr_image.lambda_image.image_uri
  package_type  = "Image"
  role          = aws_iam_role.lambda_role.arn
}