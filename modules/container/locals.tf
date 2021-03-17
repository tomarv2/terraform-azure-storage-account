locals {
  shared_tags = map(
    "name", "${var.teamid}-${var.prjid}",
    "team", var.teamid,
    "project", var.prjid
  )
  # -----------------------------------------------
  # DEFAULT CONTAINER NAMES
  #- ----------------------------------------------
  container_names = coalesce(var.container_names, ["${var.teamid}${var.prjid}"])
}
