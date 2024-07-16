terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
#   backend "s3" {
#     bucket = "ZeBucket"
#     key    = "path/to/my/key"
#     region = "eu-west-1"
#   }
}

provider "aws" {
  region     = "eu-west-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}