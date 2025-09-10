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
  region = "us-east-2"
  #changue profile
  profile = "default"

  default_tags {
    tags = {
      name = "NotiApp"
      #en enviroment se cambio debido a que ocurria error en mi maquina
      environment = terraform.workspace
    }
  }
}