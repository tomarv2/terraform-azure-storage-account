resource "azurerm_storage_container" "container" {
  for_each = toset(local.container_names)

  name                  = each.value
  storage_account_name  = var.storage_account_name
  container_access_type = var.container_access_type
}
