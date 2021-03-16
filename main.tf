locals {
  shared_tags = map(
    "name", "${var.teamid}-${var.prjid}",
    "team", var.teamid,
    "project", var.prjid
  )
}

module "global" {
  source = "git::git@tomarv2:tomarv2/terraform-global.git//common?ref=v0.0.1"
}
