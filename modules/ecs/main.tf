# ECS local Module.


# ---- Main ECS Resource ----
resource "aws_ecs" "this" {
  name    = var.ecs_name
  cluster = var.aws_ecs_cluster.id

  task_definition = var.aws_ecs_task_definition.this.arn
  desired_count   = 3 # TODO.
  iam_role        = aws.aws_iam_role.ecs.arn
  depends_on      = [var.aws_iam_role_policy.default_ecs_role_policy]

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  # LB config
  load_balancer {
    target_group_arn = var.aws_lb_target_group.ecs_service.arn
    containe_name    = var.ecs_container_name #str val.
    containe_port    = var.ecs_container_port #int val.
  }

  placement_constraints {
    trype      = "memberOf"                                                         # Restrict selection to a group of valid candidates (Objecst).
    expression = "attribute:ec.availability-zone in [${local.ecs_azs}, us-west-2b]" # FIXME.
  }

  # CloudWatch Setup
  alarms {
    enable      = true
    rollback    = true
    alarm_names = [aws_cloudwatch_metric_alarm.this.alarm_name]
  }

  # Logging Setup

}

# ----- Task Definition -----
resource "aws_ecs_task_definition" "this" {
  family = var.task_definition_family
  container_definitions = jsonencode([
    {
      name      = var.container_definition_name
      image     = var.task_definition_image
      cpu       = var.task_definition_cpu
      memory    = var.task_definition_memory
      essential = true # TODO.

      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    },

  ])

  volume {
    name      = var.task_definition_volume_name1
    host_path = var.task_definition_host_path # Eg. /ecs/service-storage
  }

  placement_constraints {
    trype      = "memberOf"                                                       # Restrict selection to a group of valid candidates (Objecst).
    expression = "attribute:ec.availability-zone in [${var.ecs_azs}, us-west-2b]" # FIXME.
  }
}

# ---- IAM Role ----
resource "aws_iam_role" "this" {
  name = "${local.resource_prefix}-default_ecs_iam_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${local.resource_prefix}-${var.ecs_name}"
  }
}