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

resource "aws_ecs_task_definition" "FASTEATS-API-COZINHA" {
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
          {
            "NAME" : "DB_SERVER",
            "value" : "${var.containerDbServer}"
          },
          { "NAME" : "DB_PORT", "value" : "${var.containerDbPort}" },
          { "NAME" : "DB_NAME", "value" : "${var.containerDbName}" },
          { "NAME" : "DB_USER", "value" : "${var.containerDbUser}" },
          { "NAME" : "DB_PASSWORD", "value" : "${var.containerDbPassword}" },
          { "NAME" : "DB_ROOT_PASSWORD", "value" : "${var.containerDbRootPassword}" },
          { "NAME" : "APP_PORT", "value" : "8080" }
        ],
        "essential" = true,
        "portMappings" = [
          {
            "containerPort" = var.containerPort,
            "hostPort"      = var.portaAplicacao
          }
        ]
      }
    ]
  )
}

resource "aws_ecs_service" "FASTEATS-API-COZINHA" {
  name            = "FASTEATS-API"
  cluster         = module.ecs.cluster_id
  task_definition = aws_ecs_task_definition.FASTEATS-API-COZINHA.arn
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
