# Nos informa o ip e nome do container criado
output "Endereco-IP" {
  value = "${docker_container.container_id.ip_address}"
}

output "Nome-do-Container" {
  value = "${docker_container.container_id.name}"
}