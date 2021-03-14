data "azurerm_storage_account_sas" "sas_token" {
  count = var.get_sas_token ? 1 : 0

  connection_string = azurerm_storage_account.storage_account.*.primary_connection_string[0]

  https_only        = true
  signed_version    = "2019-12-12"

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    queue = true
    table = true
    file  = true
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
  }

  depends_on = [azurerm_storage_account.storage_account]
}

