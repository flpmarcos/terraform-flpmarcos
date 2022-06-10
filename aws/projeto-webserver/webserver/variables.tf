variable "region" {
  type        = string
  description = "Região no AWS onde nossos recursos estarão."
  default     = "us-east-1"
}

variable "ami" {
  type        = string
  description = "Id da imagem EC2 que desejamos utilizar para nossa instância."
  default     = "ami-0a313d6098716f372"
}

variable "instance_type" {
  type        = string
  description = "Tipo de instância a ser utilizado"
  default     = "t2.micro"
}

variable "tags" {
  type        = map
  description = "Tags a serem aplicadas à nossa instância."

  default = {
    "Name"     = "Ubuntu-webserver"
    "Ambiente" = "Desenvolvimento"
    "Projeto"  = "Webserver"
  }
}