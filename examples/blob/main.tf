module "blob" {
  source = "../../modules/blob"

  storage_account_name   = "<storage_account_name>"
  storage_container_name = "test2"
  blob_name              = "test2-blob"
  blob_source            = "/tmp/<sample_file>"
  client_id              = var.client_id
  client_secret          = var.client_secret
  subscription_id        = var.subscription_id
  tenant_id              = var.tenant_id
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
