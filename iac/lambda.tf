data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../src/"
  output_path = "${path.module}/../src/lambda.zip"
}

#permiso para bucket 1
resource "aws_lambda_permission" "allow_bucket_1" {
  statement_id  = "AllowExecutionFromS3Bucket1"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.notiapp_processor_1.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.notiapp_bucket.arn
}

#permiso para bucket 2
resource "aws_lambda_permission" "allow_bucket_2" {
  statement_id  = "AllowExecutionFromS3Bucket2"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.notiapp_processor_1.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.notiapp_bucket_2.arn
}

#lambda-function
resource "aws_lambda_function" "notiapp_processor_1" {
  function_name    = "${var.lambda_function_name}-${var.environment}"
  filename         = data.archive_file.lambda_zip.output_path
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "index.handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  runtime = "nodejs22.x"

  environment {
    variables = {
      BUCKET_1 = aws_s3_bucket.notiapp_bucket.bucket
      BUCKET_2 = aws_s3_bucket.notiapp_bucket_2.bucket
      ENV         = var.environment
      REGION      = var.region
    }
  }

  tags = {
    Name        = var.lambda_function_name
    Environment = var.environment
  }
}
