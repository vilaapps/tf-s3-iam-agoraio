resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = {
    Project     = var.project
    Environment = var.environment
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id     = "move-to-glacier"
    status = "Enabled"

    filter {
      prefix = ""
    }

    transition {
      days          = var.days_to_glacier
      storage_class = var.storage_class
    }
  }
}