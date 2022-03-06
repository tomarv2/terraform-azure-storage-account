resource "azurerm_storage_account" "storage_account" {
  count = var.deploy_storage_account ? 1 : 0

  name                      = local.clean_stg_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.stg_account_tier
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = var.enable_https_traffic_only
  min_tls_version           = var.min_tls_version

  dynamic "network_rules" {
    for_each = var.network_rules
    content {
      default_action             = network_rules.value["default_action"]
      ip_rules                   = network_rules.value["ip_rules"]
      virtual_network_subnet_ids = network_rules.value["virtual_network_subnet_ids"]
    }
  }

  tags = merge(local.shared_tags, var.extra_tags)
}
