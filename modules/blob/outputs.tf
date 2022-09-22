output "name" {
  description = "Blob names"
  value       = join("", azurerm_storage_blob.default.*.name)
}
