provider "aws" {
  region = "us-east-1"
  
}

module "ec2modulo" {
  source = "./ec2"
  ec2name = "ec2-terraform"
}