variable "family" {
  description = "The family of the task definition"
  type        = string
}

variable "cpu" {
  description = "The number of CPU units"
  type        = string
}

variable "memory" {
  description = "The amount of memory in MiB"
  type        = string
}

variable "container_definitions" {
  description = "JSON-encoded list of container definitions"
  type        = string
}

