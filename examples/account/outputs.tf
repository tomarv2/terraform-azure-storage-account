output "storage_account_name" {
  description = "The name of the azure storage account."
  value       = module.account.storage_account_name
}

output "location" {
  description = "Storage account location."
  value       = module.account.location
}

output "storage_account_primary_connection_string" {
  description = "Storage account primary connection string."
  value       = module.account.storage_account_primary_connection_string
  sensitive   = true

}

output "storage_account_access_key" {
  description = "Storage account access key(SAS token)."
  value       = module.account.storage_account_access_key
  sensitive   = true
}
