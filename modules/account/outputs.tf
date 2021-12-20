output "storage_account_name" {
  description = "The name of the azure storage account."
  value       = join("", azurerm_storage_account.storage_account.*.name)
}

output "storage_account_location" {
  description = "Storage account location."
  value       = join("", azurerm_storage_account.storage_account.*.location)
}

output "storage_account_primary_connection_string" {
  description = "Storage account primary connection string."
  value       = join("", azurerm_storage_account.storage_account.*.primary_blob_connection_string)
}

output "storage_account_access_key" {
  description = "Storage account access key(SAS token)."
  value       = join("", data.azurerm_storage_account_sas.sas_token.*.sas)
}
