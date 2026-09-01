provider "aws" {
  region = var.region
}
terraform {
  backend "s3" {
    bucket         = "tf-state-demo"
    key            = "day1/vpc-ec2.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-locks"
  }
}
