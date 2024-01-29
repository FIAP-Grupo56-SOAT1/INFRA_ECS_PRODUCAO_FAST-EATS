
# Criando um modulo que utiliza os dados do infra para criação do ambiente
module "prod" {
  source                  = "../../infra"
  containerDbName         = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["containerDbName"]
  containerDbUser         = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["containerDbUser"]
  containerDbPassword     = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["containerDbPassword"]
  containerDbRootPassword = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["containerDbRootPassword"]
  containerDbServer       = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["containerDbServer"]
  containerDbPort         = jsondecode(data.aws_secretsmanager_secret_version.mysql_credentials.secret_string)["containerDbPort"]  
}


#obteando dados do secret manager
data "aws_secretsmanager_secret" "mysql" {
  name = "prod/soat1grupo56/MySQLCozinha"
}

data "aws_secretsmanager_secret_version" "mysql_credentials" {
  secret_id = data.aws_secretsmanager_secret.mysql.id
}

output "IP_alb" {
  value = module.prod.IP
}
