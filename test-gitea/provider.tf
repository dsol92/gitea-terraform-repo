terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}

provider "aws" {
    region = "ap-southeast-1"
    shared_credentials_files = ["C:\\Users\\Brenden Koo\\Desktop\\terraform-ec2\\creds.txt"]
}