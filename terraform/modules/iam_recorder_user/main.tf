resource "aws_iam_user" "this" {
  name = "${var.name}-${var.environment}"
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_iam_policy" "s3_write_policy" {
  name = "${var.name}-policy-${var.environment}"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:PutObject",
          "s3:GetObject"
        ],
        Resource = "${var.bucket_arn}/*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "s3:ListBucket"
        ],
        Resource = var.bucket_arn
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach" {
  user       = aws_iam_user.this.name
  policy_arn = aws_iam_policy.s3_write_policy.arn
}