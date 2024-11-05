provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
    //versão do sistema operacional
    ami = ""
    instance_type = "t2.micro"

  
}
//ip publico fixo
resource "aws_eip" "elasticeip" {
  //associando a ec2 criada
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elasticeip.public_ip
  
}