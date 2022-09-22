resource "azurerm_storage_blob" "default" {
  for_each = var.blobs_config !=null ? var.blobs_config : {}

  name                   = each.key
  storage_account_name   = each.value.account_name
  storage_container_name = each.value.container_name
  type                   = coalesce(each.value.storage_container_name, "Block")
  source                 = each.value.source

  # NOTE: noticed that if blob does not exist or is deleted, terraform destroy was failing
  # adding this to ignore changes
  lifecycle {
    ignore_changes = all
  }

}
