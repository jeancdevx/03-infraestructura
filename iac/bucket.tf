#s3Bucket-1
resource "aws_s3_bucket" "notiapp_bucket" {
  bucket = "${var.bucket1}-${var.environment}"
}

#s3Bucket-2
resource "aws_s3_bucket" "notiapp_bucket_2" {
  bucket = "${var.bucket2}-${var.environment}"
}

#trigger 1
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.notiapp_bucket.id
  

  lambda_function {
    lambda_function_arn = aws_lambda_function.notiapp_processor_1.arn
    events              = ["s3:ObjectCreated:Post"]
    filter_prefix       = "AWSLogs/"
    filter_suffix       = ".log"
  }

  depends_on = [aws_lambda_permission.allow_bucket_1]
}

#trigger 2
resource "aws_s3_bucket_notification" "bucket_ObjetRemove" {
  bucket = aws_s3_bucket.notiapp_bucket_2.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.notiapp_processor_1.arn
    events              = ["s3:ObjectRemoved:Delete"] #create a notification when an object or a batch of objects is removed from a bucket
    filter_prefix       = "AWSLogs/"
    filter_suffix       = ".log"
  }

  depends_on = [ aws_lambda_permission.allow_bucket_2 ]
}