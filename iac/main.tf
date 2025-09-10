terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
  profile = "jeancdev"

  default_tags {
    tags = {
      name = "NotiApp"
      environment = terraform.workspace
    }
  }
}