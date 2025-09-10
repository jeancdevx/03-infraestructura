terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "us-east-2"
  #AGREGAR O QUITAR PROFILE

  default_tags {
    tags = {
      name = "NotiApp"
      environment = "Dev"
    }
  }
}