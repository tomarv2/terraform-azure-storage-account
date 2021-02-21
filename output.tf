output "storage_account_name" {
  description = "storage account name."
  value = [azurerm_storage_account.storage_account.*.name]
}

output "storage_account_location" {
  description = "storage account location."
  value = [azurerm_storage_account.storage_account.*.location]
}

output "storage_account_primary_connection_string" {
  description = "storage account primary connection string."
  value =  [azurerm_storage_account.storage_account.*.primary_blob_connection_string]
}

output "storage_container_names" {
  value = {
    for container in azurerm_storage_container.container:
    container.id => container.name
  }
}

output "asq_names" {
  value = {
    for asq in azurerm_storage_queue.asq:
    asq.id => asq.name
  }
}

//output "asq_names_list" {
//  value = azurerm_storage_queue.asq.id
//}

output "sas_url_query_string" {
  value = data.azurerm_storage_account_sas.sas_token.sas
}
