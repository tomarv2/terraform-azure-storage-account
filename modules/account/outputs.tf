output "name" {
  description = "The name of the azure storage account."
  value       = [for stg in azurerm_storage_account.storage_account : stg.name]
}

output "location" {
  description = "Storage account location."
  value       = [for stg in azurerm_storage_account.storage_account : stg.location]
}

output "primary_connection_string" {
  description = "Storage account primary connection string."
  value       = [for stg in azurerm_storage_account.storage_account : stg.primary_connection_string]
}

output "access_key" {
  description = "Storage account access key(SAS token)."
  value       = [for token in data.azurerm_storage_account_sas.sas_token : token.sas]
}

output "id" {
  description = "The ID of the Storage Account."
  value       = [for stg in azurerm_storage_account.storage_account : stg.id]
}
