variable "project_id" {
  type    = "string"
  default = "heroic-habitat-351817"
}

variable "regiao" {
  type = "string"
  default = "southamerica-east1-a"
}

variable "nome" {
  type = "string"
  default = "vm-flpmarcos-webserver"
}

variable "tipo_maquina" {
  type = "string"
  default = "f1-micro"
}

variable "zona" {
  type = "string"
  default = "southamerica-east1-a"
}

variable "imagem" {
  type = "string"
  default = "debian-cloud/debian-9"
}

variable "nome_fw" {
  type = "string"
  default = "webserver-firewall"
}

variable "portas" {
  type = "list"
  default = ["80"]
}