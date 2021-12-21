resource "azurerm_storage_blob" "default" {
  count = var.create_blob ? 1 : 0

  name                   = var.blob_name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = var.type
  source                 = var.blob_source

  # NOTE: noticed that if blob does not exist or is deleted, terraform destroy was failing
  # adding this to ignore changes
  lifecycle {
    ignore_changes = all
  }

}
