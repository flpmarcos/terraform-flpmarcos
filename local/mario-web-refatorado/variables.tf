variable "nome_container" {
  description = "Nome do container"
  default = "supermario"
}

variable "imagem" {
  description = "Imagem do container"
  default = "pengbai/docker-supermario:latest"
}

variable "porta_interna" {
  description = "Porta interna do container"
  default = "8080"
}

variable "porta_externa" {
  description = "Porta externa do container"
  default = "80"
}