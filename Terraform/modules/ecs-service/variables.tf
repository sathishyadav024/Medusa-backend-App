variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "cluster_id" {
  description = "The ID of the ECS cluster"
  type        = string
}

variable "task_definition_arn" {
  description = "The ARN of the ECS task definition"
  type        = string
}

variable "desired_count" {
  description = "The number of desired tasks"
  type        = number
}

variable "subnets" {
  description = "The subnets to associate with the ECS service"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID to assign to the service"
  type        = string
}

variable "assign_public_ip" {
  description = "Whether to assign a public IP to the ECS tasks"
  type        = bool
}

