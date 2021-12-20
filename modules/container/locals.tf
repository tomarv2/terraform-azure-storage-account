locals {
  shared_tags = tomap(
    {
      "Name"    = "${var.teamid}-${var.prjid}",
      "team"    = var.teamid,
      "project" = var.prjid
    }
  )
  container_names = coalesce(var.container_names, ["${var.teamid}${var.prjid}"])
}
