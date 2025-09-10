data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "${var.lambda_function_name}-role-${var.environment}"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.notiapp_processor.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.notiapp_bucket.arn
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../src/"
  output_path = "${path.module}/../src/lambda.zip"
}

resource "aws_lambda_function" "notiapp_processor" {
  function_name = "${var.lambda_function_name}-${var.environment}"
  filename      = data.archive_file.lambda_zip.output_path
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  runtime       = "nodejs22.x"

  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.notiapp_bucket.bucket
      ENV         = var.environment
      REGION      = var.region
    }
  }
  
  tags = {
    Name        = var.lambda_function_name
    Environment = var.environment
  }

  depends_on = [aws_iam_role.iam_for_lambda]
}