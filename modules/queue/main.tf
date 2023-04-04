resource "azurerm_storage_queue" "asq" {
  for_each = var.queues_config

  name                 = each.key
  storage_account_name = each.value.storage_account_name
}

