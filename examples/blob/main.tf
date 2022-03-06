module "blob" {
  source = "../../modules/blob"

  storage_account_name   = "<storage_account_name>"
  storage_container_name = "test2"
  blob_name              = "test2-blob"
  blob_source            = "/tmp/<sample_file>"
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
