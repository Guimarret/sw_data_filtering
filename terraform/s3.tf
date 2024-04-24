resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-state-project"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "dev-data-mesh" {
  bucket = "dev-data-mesh"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "lambda-logs-airflow" {
  bucket = "lambda-logs-for-airflow"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "athena-db" {
  bucket = "athena-db-sw"
  lifecycle {
    prevent_destroy = true
  }
}