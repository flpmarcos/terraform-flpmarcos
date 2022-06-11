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

variable "project_name" {
  type        = string
  description = "Nome do projeto"
}


variable "instance_tags" {
  type        = map
  description = "Tags a serem aplicadas à nossa instância."
}

variable "user_data" {
  type        = string
  description = "Script a ser executado durante a criação da instância."
}

variable "i_from_port" {
  type        = string
  description = "Ingress Origin port to receive connections."
}

variable "i_to_port" {
  type        = string
  description = "Ingress Destination port to pass connections to."
}

variable "i_ip_range" {
  type        = list
  description = "Ingress Ip range that will be able to connect to this server."
}

variable "e_from_port" {
  type        = string
  description = "Egress Origin port to receive connections from."
}

variable "e_to_port" {
  type        = string
  description = "Destination port to pass connections to."
}

variable "e_ip_range" {
  type        = list
  description = "Ip range that will be able to connect to this server."
}

variable "sg_tags" {
  type        = map
  description = "Tags a serem aplicadas no security group"
}

variable "vpc_ip_range" {
  type        = string
  description = "Range de IPs para a VPC"
}

variable "vpc_tags" {
  type        = map
  description = "Tags a serem aplicadas a vpc"
}

variable "subnet_tags" {
  type        = map
  description = "Tags a serem aplicadas a subnet"
}

variable "gw_tags" {
  type        = map
  description = "Tags a serem aplicadas ao gateway de internet"
}

variable "route_ips" {
  type        = string
  description = "Range de IPs a serem aplicados na route table"
}

variable "route_tags" {
  type        = map
  description = "Tags a serem aplicadas na route table"
}