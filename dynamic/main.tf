provider "aws" {
  region = "us-east-1"
}

variable "ingressrules" {
  type    = list(number)
  default = [80, 443]
}

variable "egressrules" {
  type    = list(number)
  default = [80, 443, 25, 3306, 53, 8080]
}

resource "aws_instance" "ec2" {
  //versão do sistema operacional
  ami             = ""
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name] //referencia ao security group
}

//criação de um security group
resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  //regras de entrada e saída
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}
