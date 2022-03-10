output "registry_id" {
  value       = module.this.enabled ? module.ecrpublic.registry_id : null
  description = "Registry ID"
}

output "registry_url" {
  value       = module.this.enabled ? module.ecrpublic.repository_url : null
  description = "Repository URL"
}

output "repository_name" {
  value       = module.this.enabled ? module.ecrpublic.repository_name : null
  description = "Registry name"
}
