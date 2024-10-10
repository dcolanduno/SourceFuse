output "load_balancer_dns" {
  value = aws_lb.main.dns_name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.nginx_bucket.bucket
}
