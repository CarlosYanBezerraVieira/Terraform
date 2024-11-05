provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
    //versão do sistema operacional
    ami = ""
    instance_type = "t2.micro"

  
}
