resource "azurerm_storage_queue" "asq" {
  for_each = toset(var.asq_names)

  name                 = each.value
  storage_account_name = var.storage_account_name
}
