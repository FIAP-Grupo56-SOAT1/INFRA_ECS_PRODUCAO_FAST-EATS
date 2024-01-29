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

variable "containerDbPort" {
  type    = string
  default = "3306"
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

variable "containerMercadoPagoEmailEmpresa" {
  type    = string
  default = "cozinha@lanchonete-fiap.com.br"
}


variable "containerMercadoPagoCredential" {
  type    = string
  default = "TEST-2087963774082813-080820-ee2b9b80edbdecf3ea8453bb8c088bc7-64946408"
}


variable "containerMercadoPagoUderId" {
  type    = string
  default = "64946408"
}

variable "containerMercadoPagoTipocozinha" {
  type    = string
  default = "pix"
}

variable "URL_PEDIDO_SERVICE" {
  type    = string
  default = "http://localhost:8082"
}

variable "URL_COZINHA_PEDIDO_SERVICE" {
  type    = string
  default = "http://localhost:8083"
}

