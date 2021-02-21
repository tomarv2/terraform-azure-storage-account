# change to -> sha256(resourceGroupName+subscription_id)[:8])

resource "random_string" "string" {
  length = 3
  special = false
  lower = true
  upper = false
}

locals{
    stg_account_name  =  coalesce(var.storage_account_name, "${var.teamid}-${var.prjid}")
    clean_stg_account = substr(replace(local.stg_account_name, "-", ""), 0, 20)
    clean_stg_account_name = format("%s%s",local.clean_stg_account,tostring(random_string.string.result))
}

resource "azurerm_storage_account" "storage_account" {
  count                              = var.add_storage_account ? 1 : 0

  name                               = local.clean_stg_account_name
  resource_group_name                = var.rg_name
  location                           = var.storage_account_location
  account_tier                       = var.stg_account_tier
  account_replication_type           = var.account_replication_type

  tags                               = merge(local.shared_tags)

  depends_on = [null_resource.resource_group_setup]
}

resource "azurerm_storage_container" "container" {
  for_each                             = toset(var.container_names)

  name                                = each.value
  storage_account_name                = lower(local.clean_stg_account_name)
  container_access_type               = var.container_access_type

  depends_on = [azurerm_storage_account.storage_account]
}

resource "azurerm_storage_queue" "asq" {
  for_each                             = toset(var.asq_names)

  name                               = each.value
  storage_account_name               = lower(local.clean_stg_account_name)

  depends_on = [azurerm_storage_account.storage_account]
}

resource "null_resource" "resource_group_setup" {
  # Resource Group creation is eventually consistent, so add a delay.
    provisioner "local-exec" {
    command = <<EOT
      echo "sleeping for 30 seconds...";
      sleep 30;
      echo "completing sleep";
      finished=false
      while ! $finished; do
          az group exists -n ${var.rg_name}
          finished=true
      done;
    EOT
    }
}

data "azurerm_storage_account_sas" "sas_token" {
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

