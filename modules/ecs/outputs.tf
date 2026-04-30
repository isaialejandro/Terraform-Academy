
output "ecs_cluster_arn" {
  description = "Current ECS Cluster ARN."
  value       = aws_ecs.this.arn
}

output "task_definition_arn" {
  description = "Currennt ECS Task Definition ARN."
  value = aws_ecs_task_definition.thnis.arn
}