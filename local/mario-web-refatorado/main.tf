terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Baixar a imagem do Projeto Docker-SuperMario
resource "docker_image" "image_id" {
  name = "${var.imagem}"
}


# Inicia o Container
resource "docker_container" "container_id" {
  name  = "${var.nome_container}"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "${var.porta_interna}"
    external = "${var.porta_externa}"
  }
}

# Nos informa o ip e nome do container criado
output "Endereco-IP" {
  value = "${docker_container.container_id.ip_address}"
}

output "Nome-do-Container" {
  value = "${docker_container.container_id.name}"
}