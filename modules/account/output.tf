output "storage_account_name" {
  description = "storage account name."
  value       = join("", azurerm_storage_account.storage_account.*.name)
}

output "storage_account_location" {
  description = "storage account location."
  value       = join("", azurerm_storage_account.storage_account.*.location)
}

output "storage_account_primary_connection_string" {
  description = "storage account primary connection string."
  value       = join("", azurerm_storage_account.storage_account.*.primary_blob_connection_string)
}

output "storage_account_access_key" {
  value = join("", data.azurerm_storage_account_sas.sas_token.*.sas)
}
