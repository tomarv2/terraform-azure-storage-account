locals {
  container_names = coalesce(var.container_names, ["${var.teamid}${var.prjid}"])
}
