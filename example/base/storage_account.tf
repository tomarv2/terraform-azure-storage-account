module "storage_account" {
    source = "./../../../_modules/azure/storage_account/storage_account"

    email                                   = var.email
    teamid                                  = var.teamid
    prjid                                   = var.prjid
    client_id                               = var.client_id
    client_secret                           = var.client_secret
    subscription_id                         = var.subscription_id
    tenant_id                               = var.tenant_id
    rg_name                                 = var.rg_name

    storage_account_name                    = var.storage_account_name
    add_storage_account                     = var.add_storage_account
    storage_account_location                = var.storage_account_location

    asq_names                               = var.asq_names

    container_names                         =  var.container_names
}
