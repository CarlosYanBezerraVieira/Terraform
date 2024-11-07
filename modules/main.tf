provider "aws" {
  region = "us-east-1"
  
}

module "ec2modulo" {
  source = "./ec2"
  ec2name = "ec2-terraform"
}

//pegando o id do modulo ec2
output "ec2_id" {
  value = module.ec2modulo.instance_id
}