resource "aws_s3_bucket" "s3_staging_bn_public" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy = templatefile("./sitemap_onS3hosting/templates/s3-policy.json", { bucket = var.bucket_name })

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://${var.root_domain_name}"]
    max_age_seconds = 3000
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  tags = var.common_tags
}