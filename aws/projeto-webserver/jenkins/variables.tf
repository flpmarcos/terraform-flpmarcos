variable "project_name" {
  type        = string
  description = "Nome do projeto"
  default     = "Jenkins"
}

variable "instance_tags" {
  type        = map
  description = "Tags a serem aplicadas à nossa instância."

  default = {
    "Name"     = "jenkins-1"
    "Ambiente" = "Desenvolvimento"
    "Projeto"  = "Jenkins"
  }
}

variable "user_data" {
  type        = string
  description = "Script a ser executado durante a criação da instância."

  default = <<-EOF
              #!/bin/bash
              wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
              sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
              sudo apt update
              sudo apt install default-jre -y
              sudo apt install jenkins -y
              sudo systemctl enable jenkins
              sudo systemctl start jenkins
              EOF
}

variable "i_from_port" {
  type        = string
  description = "Ingress Origin port to receive connections."
  default     = "8080"
}

variable "i_to_port" {
  type        = string
  description = "Ingress Destination port to pass connections to."
  default     = "8080"
}

variable "i_ip_range" {
  type        = list
  description = "Ingress Ip range that will be able to connect to this server."
  default     = ["0.0.0.0/0"]
}

variable "e_from_port" {
  type        = string
  description = "Egress Origin port to receive connections from."
  default     = "0"
}

variable "e_to_port" {
  type        = string
  description = "Destination port to pass connections to."
  default     = "0"
}

variable "e_ip_range" {
  type        = list
  description = "Ip range that will be able to connect to this server."
  default     = ["0.0.0.0/0"]
}

variable "vpc_ip_range" {
  type        = string
  description = "Range de IPs para a VPC"
  default     = "12.0.0.0/16"
}

variable "gw_tags" {
  type        = map
  description = "Tags a serem aplicadas ao gateway de internet"

  default = {
    "Name" = "dev-jenkins-gw"
  }
}

variable "route_ips" {
  type        = string
  description = "Range de IPs a serem aplicados na route table"
  default     = "0.0.0.0/0"
}

variable "route_tags" {
  type        = map
  description = "Tags a serem aplicadas na route table"

  default = {
    "Name" = "dev-jenkins-route-table"
  }
}

variable "sg_tags" {
  type        = map
  description = "Tags a serem aplicadas no security group"

  default = {
    "Name" = "dev-jenkins-sg"
  }
}

variable "vpc_tags" {
  type        = map
  description = "Tags a serem aplicadas a vpc"

  default = {
    "Name" = "dev-jenkins-vpc"
  }
}

variable "subnet_tags" {
  type        = map
  description = "Tags a serem aplicadas a subnet"

  default = {
    "Name" = "dev-jenkins-subnet"
  }
}