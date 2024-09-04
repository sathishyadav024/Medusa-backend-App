resource "aws_ecs_service" "medusa_service" {
  name            = var.service_name
  cluster         = var.cluster_id
  task_definition = var.task_definition_arn
  desired_count   = var.desired_count

  network_configuration {
    subnets          = var.subnets
    security_groups  = [var.security_group_id]
    assign_public_ip = var.assign_public_ip
  }

  launch_type = "FARGATE"
}

