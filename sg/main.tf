provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  //versão do sistema operacional
  ami           = ""
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]  //referencia ao security group
}

//criação de um security group
resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

//regras de entrada e saída
  ingress = {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress = {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
