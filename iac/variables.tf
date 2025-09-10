variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
  default     = "notiapp-bucket"
}

variable "lambda_function_name" {
  description = "Nombre de la funcion Lambda"
  type        = string
  default     = "notiapp-processor"
}

variable "environment" {
  description = "Entorno de despliegue (dev, qa, prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}