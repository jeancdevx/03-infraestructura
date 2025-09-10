resource "aws_s3_bucket" "notiapp_bucket" {
  bucket = "${var.bucket_name}-${var.environment}"
}

# resource "aws_s3_bucket_notification" "bucket_notification" {
#   bucket = aws_s3_bucket.notiapp_bucket.id

#   lambda_function {
#     lambda_function_arn = aws_lambda_function.notiapp_processor.arn
#     events              = ["s3:ObjectCreated:*"]
#     filter_prefix       = "uploads/"
#     filter_suffix       = ".json"
#   }

#   depends_on = [aws_lambda_permission.allow_bucket]
# }