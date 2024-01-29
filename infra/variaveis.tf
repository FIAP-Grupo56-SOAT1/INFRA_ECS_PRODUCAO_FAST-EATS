variable "nome_repositorio" {
  type    = string
  default = "repositorio-terraform-api-cozinha"
}
variable "cargoIam" {
  type    = string
  default = "fasteats-api-ms-cozinha"
}

variable "perfil" {
  type    = string
  default = "fasteats-api-ms-cozinha"
}

variable "portaAplicacao" {
  type    = number
  default = 8080
}

variable "ambiente" {
  type    = string
  default = "fasteats-api-cozinha"
}

variable "containerPort" {
  type    = number
  default = 8080
}

variable "containerDbPort" {
  type    = number
  default = 27017
}

variable "containerName" {
  type    = string
  default = "fasteats-api-cozinha"
}

variable "imagemDocker" {
  type    = string
  default = "fiap56soat1/fasteats-ms-producao-api:latest"
}

variable "containerDbServer" {
  type = string
}

variable "containerDbName" {
  type = string
}

variable "containerDbUser" {
  type = string
}

variable "containerDbPassword" {
  type = string
}

variable "containerDbRootPassword" {
  type = string
}

variable "url_pedido_service" {
  type    = string  
}

variable "url_cozinha_pedido_service" {
  type    = string  
}

