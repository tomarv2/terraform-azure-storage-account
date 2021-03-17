#-----------------------------------------------
# Storage Account
#-----------------------------------------------
output "storage_account_name" {
  description = "storage account name."
  value       = module.account.storage_account_name
}

output "storage_account_location" {
  description = "storage account location."
  value       = module.account.storage_account_location
}

output "storage_account_primary_connection_string" {
  description = "storage account primary connection string."
  value       = module.account.storage_account_primary_connection_string
}

output "storage_account_access_key" {
  value       = module.account.storage_account_access_key
  description = "SAS token"
}
#-----------------------------------------------
# Storage Container
#-----------------------------------------------
output "storage_container_names" {
  description = "storage container names."
  value       = module.container.storage_container_names
}
#-----------------------------------------------
# Storage Queue
#-----------------------------------------------
output "storage_queues" {
  description = "storage queue names."
  value       = module.queue.asq_names
}
#-----------------------------------------------
# Storage Blob
#-----------------------------------------------
output "storage_blob_name" {
  description = "storage blob name."
  value       = module.blob.blob_name
}