# Criando uma Instância Ubuntu no AWS
provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "server1" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  tags = "${var.tags}"
}