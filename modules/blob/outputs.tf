output "blob_name" {
  description = "The name of the azure storage blob"
  value       = join("", azurerm_storage_blob.default.*.name)
}
