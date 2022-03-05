module "container" {
  source = "../../modules/container"

  storage_account_name = "<existing_storage_account_name>"
  container_names      = ["<container_1>", "<container_2>"]

  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
