module "account" {
  source = "../../modules/account"

  rg_name = "security-terraform"

  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
