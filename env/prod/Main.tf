
# Criando um modulo que utiliza os dados do infra para criação do ambiente
module "prod" {
  source                  = "../../infra"
  APP_PORT         = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["APP_PORT"]
  DB_USERNAME         = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["DB_USERNAME"]
  DB_PASSWORD         = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["DB_PASSWORD"]
  DB_NAME         = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["DB_NAME"]
  DB_PORT         = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["DB_PORT"]
  DB_HOST         = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["DB_HOST"]
  URL_PEDIDO_SERVICE         = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["URL_PEDIDO_SERVICE"]
  URL_PAGAMENTO_SERVICE         = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["URL_PAGAMENTO_SERVICE"]    
}


#obteando dados do secret manager
data "aws_secretsmanager_secret" "mysql" {
  name = "prod/soat1grupo56/MongoCozinha"
}

data "aws_secretsmanager_secret_version" "mysql_credentials" {
  secret_id = data.aws_secretsmanager_secret.mysql.id
}

output "IP_alb" {
  value = module.prod.IP
}
