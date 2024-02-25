variable "regiao" {
  type    = string
  default = "us-east-1"
}

variable "nome_repositorio" {
  description = "Nome do repositório de imagens Docker"
  type    = string
  default = "microservico-cozinha"
}

variable "portaAplicacao" {
  type    = number
  default = 8082
}

variable "imagemDocker" {
  type    = string
  default = "730335661438.dkr.ecr.us-east-1.amazonaws.com/microserviceo-cozinha:latest"
}

variable "containerDbPort" {
  type    = string
  default = "27017"
}

variable "containerDbServer" {
  type    = string
  default = "localhost"
}

variable "containerDbName" {
  type    = string
  default = "fasteatsproducaodb"
}

variable "containerDbUser" {
  type    = string
  default = "fiap56"
}

variable "containerDbPassword" {
  type    = string
  default = "fiapsoat1grupo56"
}

variable "url_pagamento_service" {
  type    = string
  default = "http://ecs-fasteats-api-pagamento-399390289.us-west-2.elb.amazonaws.com"
}

variable "url_pedido_service" {
  type    = string
  default = "http://54.163.63.60"
}

variable "micro_servico" {
  type    = string
  default = "cozinha"
}

######### OBS: a execution role acima foi trocada por LabRole devido a restricoes de permissao na conta da AWS Academy ########
variable "execution_role_ecs" {
  type    = string
  default = "arn:aws:iam::730335661438:role/LabRole" #aws_iam_role.ecsTaskExecutionRole.arn
}

variable "repositorio_url" {
  default = "730335661438.dkr.ecr.us-east-1.amazonaws.com/microservico-cozinha"
}

variable "cpu_task" {
  type    = number
  default = 256
}

variable "memory_task" {
  type    = number
  default = 512
}

variable "cpu_container" {
  type    = number
  default = 256
}

variable "memory_container" {
  type    = number
  default = 512
}


variable "container_insights" {
  type        = bool
  default     = false
  description = "Set to true to enable container insights on the cluster"
}