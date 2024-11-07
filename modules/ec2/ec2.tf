variable "ec2name" {
  type    = string

}

resource "aws_instance" "ec2" {
  //versão do sistema operacional
  ami           = ""
  instance_type = "t2.micro"
  tags = {
    Name: var.ec2name
  }
}
//expondo o atributo id do recurso aws_instance
  output "instance_id" {
    value = aws_instance.ec2.id

}
