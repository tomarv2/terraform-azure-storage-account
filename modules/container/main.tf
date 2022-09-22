resource "azurerm_storage_container" "container" {
  for_each = var.storage_containers_config !=null ? var.storage_containers_config : {}

  name                  = each.key
  storage_account_name  = each.value.storage_account_name
  container_access_type = coalesce(each.value.container_access_type, "private")
}
