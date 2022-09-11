output "mongodb_connection_strings" {
  value = module.mongodb.mongodb_connection_strings
}

output "ecs_cluster_name" {
    value = module.ecs.ecs_cluster_name
}

output "ecs_service_name" {
    value = module.ecs.ecs_service_name
}