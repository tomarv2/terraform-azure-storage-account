output "blob_name" {
  value = join("", azurerm_storage_blob.default.*.name)
}