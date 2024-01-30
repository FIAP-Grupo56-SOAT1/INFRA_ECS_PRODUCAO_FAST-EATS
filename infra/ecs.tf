# Arquivo responsável por criar o cluster ECS e o serviço ECS

module "ecs" {
  source       = "terraform-aws-modules/ecs/aws"
  cluster_name = var.ambiente
  cluster_configuration = {
    execute_command_configuration = {
      logging = "OVERRIDE"
      log_configuration = {
        cloud_watch_log_group_name = "/aws/ecs/aws-ec2"
      }
    }
  }

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 50
      }
    }
  }
}


resource "aws_ecs_task_definition" "FASTEATS-API" {
  family                   = "FASTEATS-TASK"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = aws_iam_role.cargo.arn
  container_definitions = jsonencode(
    [
      {
        "name"   = var.containerName
        "image"  = var.imagemDocker
        "cpu"    = 1024
        "memory" = 2048
        "environment" = [                  
          { "NAME" : "APP_PORT", "value" : "8082" },
          { "NAME" : "DB_USERNAME", "value" : "fiap56" },
          { "NAME" : "DB_PASSWORD", "value" : "fiapsoat1grupo56" },
          { "NAME" : "DB_NAME", "value" : "fasteatsproducaodb" },
          { "NAME" : "DB_PORT", "value" : "27017" },
          { "NAME" : "DB_HOST", "value" : "54.163.63.60" },
          { "NAME" : "URL_PEDIDO_SERVICE", "value" : "http://ecs-fasteats-919425977.us-east-1.elb.amazonaws.com:8080" },
          { "NAME" : "URL_PAGAMENTO_SERVICE", "value" : "http://ecs-fasteats-api-pagamento-399390289.us-west-2.elb.amazonaws.com:8080" }
        ]
        "essential" = true
        "portMappings" = [
          {
            "containerPort" = "${var.containerPort}"
            "hostPort"      = "${var.portaAplicacao}"
          }
        ]
      }
  ])
}

resource "aws_ecs_service" "FASTEATS-API" {
  name            = "FASTEATS-API"
  cluster         = module.ecs.cluster_id
  task_definition = aws_ecs_task_definition.FASTEATS-API.arn
  desired_count   = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.alvo.arn
    container_name   = var.containerName
    container_port   = var.containerPort
  }

  network_configuration {
    subnets         = module.vpc.private_subnets
    security_groups = [aws_security_group.privado.id, aws_security_group.rds_sg.id]
  }

  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
  }
}
