resource "azurerm_storage_account" "storage_account" {
  count                              = var.deploy_storage_account ? 1 : 0

  name                               = local.clean_stg_account_name
  resource_group_name                = var.rg_name
  location                           = var.storage_account_location
  account_tier                       = var.stg_account_tier
  account_replication_type           = var.account_replication_type

  tags                               = merge(local.shared_tags)
}
