resource "azurerm_storage_blob" "default" {
  count = var.create_blob ? 1 : 0

  name = local.blob_name

  storage_account_name   = local.clean_stg_account_name
  storage_container_name = local.container_name_for_blob
  type                   = var.type
  source                 = var.blob_source
}