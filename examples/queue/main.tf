module "queue" {
  source = "../../modules/queue"

  storage_account_name = "<existing_storage_account_name>"
  asq_names            = ["test3-asq", "test4-asq"]

  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
