terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket = "ze_my_bucket"
    key    = "tf-infra/env/prod/eu-west-1/argo/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}