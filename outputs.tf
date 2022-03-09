output "registry_id" {
  value       = module.this.enabled ? aws_ecrpublic_repository.this[var.repository_configs[0].name].registry_id : ""
  description = "Registry ID"
}

output "repository_name" {
  value       = module.this.enabled ? aws_ecrpublic_repository.this[var.repository_configs[0].name].repository_name : ""
  description = "Name of first repository created"
}

output "repository_url" {
  value       = module.this.enabled ? aws_ecrpublic_repository.this[var.repository_configs[0].name].repository_uri : ""
  description = "URL of first repository created"
}

output "repository_arn" {
  value       = module.this.enabled ? aws_ecrpublic_repository.this[var.repository_configs[0].name].arn : ""
  description = "ARN of first repository created"
}

output "repository_url_map" {
  value = zipmap(
    values(aws_ecrpublic_repository.this)[*].repository_name,
    values(aws_ecrpublic_repository.this)[*].repository_uri
  )
  description = "Map of repository names to repository URLs"
}

output "repository_arn_map" {
  value = zipmap(
    values(aws_ecrpublic_repository.this)[*].repository_name,
    values(aws_ecrpublic_repository.this)[*].arn
  )
  description = "Map of repository names to repository ARNs"
}
