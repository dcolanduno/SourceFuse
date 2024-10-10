resource "aws_s3_bucket" "nginx_bucket" {
  bucket = "my-nginx-bucket-123456" # Ensure the bucket name is globally unique
}
resource "aws_s3_bucket_policy" "nginx_bucket_policy" {
  bucket = aws_s3_bucket.nginx_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "s3:PutObject"
        Resource = "${aws_s3_bucket.nginx_bucket.arn}/*"
      }
    ]
  })
}
