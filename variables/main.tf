provider "aws" {
  region = "us-east-1"
}

//variaveis padrões
variable "vpcname" {
  type    = string
  default = "myvpc"
}

variable "sshport" {
  type    = number
  default = 22
}

variable "enabled" {
  type    = bool
  default = true

}

variable "mylist" {
  type    = list(string)
  default = ["value1", "value2"]
}

variable "mymap" {
  type    = map(string)
  default = { key1 = "value1" }
}

//variaveis de entrada
variable "inputname" {
  type        = string
  description = "Digite o nome da sua VPC"

}


resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  //Variaveis locais
  #   tags = {
  #     Name = var.mymap["key1"]
  #     Name = var.mylist[0]
  #     Name = var.vpcname

  #   }

  //variaveis de entrada
  tags = {
    Name = var.inputname
  }

}

//variaveis de saida
output "vpcid" {
  value = aws_vpc.myvpc.id
}


//truplas
variable "mytruple" {
  type    = tuple([string, number, string])
  default = ["cat", 1, "dog"]

}

//objetos
variable "myobject" {
  type = object({
    name = string,
    port = list(number),
  })
  default = {
    name = "Yan"
    port = [22, 25, 80]
  }
}
