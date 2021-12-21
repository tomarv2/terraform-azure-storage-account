module "queue" {
  source = "../../modules/queue"

  storage_account_name = "<existing_storage_account_name>"
  asq_names            = ["test3-asq", "test4-asq"]
  client_id            = var.client_id
  client_secret        = var.client_secret
  subscription_id      = var.subscription_id
  tenant_id            = var.tenant_id
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
