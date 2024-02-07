terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    ovh = {
      source  = "ovh/ovh"
      version = ">= 0.36"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}

provider "ovh" {
  endpoint = "ovh-eu"
}