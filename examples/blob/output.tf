#-----------------------------------------------
# Storage Blob
#-----------------------------------------------
output "storage_blob_name" {
  description = "storage blob name."
  value       = module.blob.blob_name
}