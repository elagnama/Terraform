terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.30"
    }
  }
  required_version = "1.14.4"
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"

}