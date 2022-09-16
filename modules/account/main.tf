resource "azurerm_storage_account" "storage_account" {
  for_each = var.storage_accounts_config != null ? var.storage_accounts_config : {}

  name                             = each.key
  resource_group_name              = each.value.resource_group
  location                         = try(each.value.location, "westus2")
  account_tier                     = try(each.value.account_tier, "Standard")
  account_replication_type         = try(each.value.account_replication_type, "GRS")
  enable_https_traffic_only        = try(each.value.enable_https_traffic_only, true)
  min_tls_version                  = try(each.value.min_tls_version, "TLS1_2")
  allow_nested_items_to_be_public  = try(each.value.allow_nested_items_to_be_public, false)
  cross_tenant_replication_enabled = try(each.value.cross_tenant_replication_enabled, true)

  dynamic "network_rules" {
    for_each = var.network_rules
    content {
      default_action             = network_rules.value["default_action"]
      ip_rules                   = network_rules.value["ip_rules"]
      virtual_network_subnet_ids = network_rules.value["virtual_network_subnet_ids"]
    }
  }

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" || var.managed_identity_type == "SystemAssigned, UserAssigned" ? var.managed_identity_ids : null
    }
  }
  tags = merge(local.shared_tags, var.extra_tags)
}
