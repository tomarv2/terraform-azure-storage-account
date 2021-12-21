module "container" {
  source = "../../modules/container"

  storage_account_name = "<existing_storage_account_name>"
  container_names      = ["<container_1>", "<container_2>"]
  client_id            = var.client_id
  client_secret        = var.client_secret
  subscription_id      = var.subscription_id
  tenant_id            = var.tenant_id
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
