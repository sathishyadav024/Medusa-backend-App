provider "aws" {
  region = "us-east-1"
#access_key = var.aws_access_key_id
#secret_key = var.aws_secret_access_key
}

module "vpc" {
  source               = "./modules/vpc"
  cidr_block           = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
}

module "ecs_cluster" {
  source       = "./modules/ecs-cluster"
  cluster_name = "medusa-cluster"
}

module "ecs_task_definition" {
  source               = "./modules/ecs-task-definition"
  family               = "medusa-task"
  cpu                  = "256"
  memory               = "512"
  container_definitions = jsonencode([
    {
      name      = "medusa-container"
      image     = "your-docker-image"
      essential = true
portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

module "ecs_service" {
  source             = "./modules/ecs-service"
  service_name       = "medusa-service"
  cluster_id         = module.ecs_cluster.ecs_cluster_id
  task_definition_arn = module.ecs_task_definition.task_definition_arn
  desired_count      = 1
  subnets            = module.vpc.public_subnets
  security_group_id  = module.vpc.security_group_id
  assign_public_ip   = true
}

