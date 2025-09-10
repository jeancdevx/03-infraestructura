variable "bucket1" {
  description = "Nombre del bucket S3"
  type        = string
  default     = "notiapp-bucket"
}

variable "bucket2" {
  description = "Nombre del bucket S3"
  type        = string
  default     = "notiapp-bucket-2"
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
