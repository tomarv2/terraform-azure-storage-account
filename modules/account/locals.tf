locals {
  shared_tags = tomap(
    {
      "Name"    = "${var.teamid}-${var.prjid}",
      "team"    = var.teamid,
      "project" = var.prjid
    }
  )

  stg_account_name       = coalesce(var.storage_account_name, "${var.teamid}${var.prjid}")
  clean_stg_account      = substr(replace(local.stg_account_name, "-", ""), 0, 20)
  clean_stg_account_name = format("%s%s", local.clean_stg_account, tostring(random_string.string.result))
}
