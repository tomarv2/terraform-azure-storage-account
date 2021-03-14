resource "azurerm_storage_container" "container" {
  for_each = toset(var.container_names)

  name                  = each.value
  storage_account_name  = lower(local.clean_stg_account_name)
  container_access_type = var.container_access_type

  depends_on = [azurerm_storage_account.storage_account]
}
