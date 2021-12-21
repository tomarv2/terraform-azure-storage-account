module "account" {
  source = "../../modules/account"

  rg_name         = "<existing_resource_group_name>"
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "container" {
  source = "../../modules/container"

  storage_account_name = module.account.storage_account_name
  container_names      = ["test1", "test2"]
  client_id            = var.client_id
  client_secret        = var.client_secret
  subscription_id      = var.subscription_id
  tenant_id            = var.tenant_id
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "queue" {
  source = "../../modules/queue"

  storage_account_name = module.account.storage_account_name
  asq_names            = ["test1-asq", "test2-asq"]
  client_id            = var.client_id
  client_secret        = var.client_secret
  subscription_id      = var.subscription_id
  tenant_id            = var.tenant_id
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "blob" {
  source = "../../modules/blob"

  storage_account_name   = module.account.storage_account_name
  storage_container_name = "test1"
  blob_name              = "test-blob"
  blob_source            = "test.text"
  client_id              = var.client_id
  client_secret          = var.client_secret
  subscription_id        = var.subscription_id
  tenant_id              = var.tenant_id
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}