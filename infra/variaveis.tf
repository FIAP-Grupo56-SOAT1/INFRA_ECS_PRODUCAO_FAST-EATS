variable "nome_repositorio" {
  type    = string
  default = "repositorio-terraform-api-producao"
}
variable "cargoIam" {
  type    = string
  default = "fasteats-api-ms-producao"
}

variable "perfil" {
  type    = string
  default = "fasteats-api-ms-producao"
}

variable "portaAplicacao" {
  type    = number
  default = 8082
}

variable "ambiente" {
  type    = string
  default = "fasteats-api-cozinha"
}

variable "containerPort" {
  type    = number
  default = 8080
}

variable "containerName" {
  type    = string
  default = "fasteats-api-cozinha"
}

variable "imagemDocker" {
  type    = string
  default = "fiap56soat1/fasteats-ms-producao-api:latest"
}



/*MONGO DB */


variable "APP_PORT" {
  type    = number
}

variable "DB_USERNAME" {
  type    = string
}

variable "DB_PASSWORD" {
  type    = string
}

variable "DB_NAME" {
  type    = string
}

variable "DB_PORT" {
  type    = number
}

variable "DB_HOST" {
  type    = string
}

variable "URL_PEDIDO_SERVICE" {
  type    = string
}

variable "URL_PAGAMENTO_SERVICE" {
  type    = string
}
