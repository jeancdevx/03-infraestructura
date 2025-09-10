resource "aws_s3_bucket" "notiapp_bucket" {
  bucket = "${var.bucket_name}-${var.environment}"
}


