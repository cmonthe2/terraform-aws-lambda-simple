
terraform {
  required_version = ">= 1.8.0"

  backend "s3" {
    bucket         = "tfstate-cif0ip"
    key            = "cmonthe2/lambda/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "tf-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = ">= 2.4.0"
    }
  }
}


provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}
