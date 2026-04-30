
variable "ecs_azs" {
  type        = list(string)
  description = "List of Availavility Zones."

  validation {
    condition     = length(var.ecs_azs) == 2
    error_message = "At least 2 AZ´s are required."
  }
}

variable "ecs_name" {
  type        = string
  description = "Default ECS Service name."
}

variable "aws_ecs_cluster" {
  type        = string
  description = "Default ECS Cluster."
}

variable "task_definition_family" {
  type        = string
  description = "Task Definition Family for ECS Cluster"
}

variable "container_definition_name" {
  type        = string
  description = "Container Definition name for ECS Cluster."
}

variable "task_definition_image" {
  type        = string
  description = "Default ECS Task Definition image."
}

variable "task_defdinition_cpu" {
  type        = string
  description = "Used CPU for ECS Task Definition."
}

variable "task_defdinition_memory" {
  type        = string
  description = "Used Memory for ECS Task Definition."
}


# ---- Log Setup ----

variable "enable_log_config" {
  type        = bool
  description = "Flag to enable Log Config for current ECS CLuster."
}