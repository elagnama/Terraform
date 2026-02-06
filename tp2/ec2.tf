terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.30"
    }
  }
  required_version = "1.14.4"
}

provider "aws" {
    region = "us-east-1"
    shared_credentials_files = [ "~/.aws/credentials" ]
    profile = "default"
}

resource "aws_instance" "my_instance" {
    ami           = "ami-0e001c9271cf7f3b9"
    instance_type = "t3.micro"
    key_name = "devops-ela"
    tags = {
        Name = "ec2-ela"
    }
  
}