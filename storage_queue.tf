resource "azurerm_storage_queue" "asq" {
  for_each = toset(var.asq_names)

  name                 = each.value
  storage_account_name = lower(local.clean_stg_account_name)

  depends_on = [azurerm_storage_account.storage_account]

}
