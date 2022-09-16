data "azurerm_storage_account_sas" "sas_token" {
  for_each = azurerm_storage_account.storage_account

  connection_string = each.value.primary_connection_string

  https_only     = true
  signed_version = "2019-12-12"

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    queue = true
    table = false
    file  = false
  }

  start  = "2020-10-02"
  expiry = "2030-03-21"

  permissions {
    read    = true
    write   = true
    delete  = true
    list    = true
    add     = true
    create  = true
    update  = true
    process = false
    tag     = false
    filter  = false
  }

  depends_on = [azurerm_storage_account.storage_account]
}
