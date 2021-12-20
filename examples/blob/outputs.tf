#-----------------------------------------------
# Storage Blob
#-----------------------------------------------
output "storage_blob_name" {
  description = "The name of the azure storage blob."
  value       = module.blob.blob_name
}
