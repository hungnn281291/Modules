output "prefix" {
  description = "Prefix name."
  value       = local.prefix
}

output "tags" {
  description = "tags."
  value       = local.tags
}

output "generated_names" {
  description = "Generated names."
  value       = local.generated_names
}

output "environment" {
  description = "Environment name."
  value       = var.environment
}

output "location" {
  description = "Location"
  value       = var.location
}

output "env_abbr" {
  description = "Abbreviated environment name."
  value       = local.env_abbr
}
