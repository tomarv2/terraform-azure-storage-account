locals {
  # -----------------------------------------------
  # UPDATED STORAGE BUCKET NAME
  #- ----------------------------------------------
  stg_account_name       = coalesce(var.storage_account_name, "${var.teamid}${var.prjid}")
  clean_stg_account      = substr(replace(local.stg_account_name, "-", ""), 0, 20)
  clean_stg_account_name = format("%s%s", local.clean_stg_account, tostring(random_string.string.result))
  # -----------------------------------------------
  # DEFAULT CONTAINER NAMES
  #- ----------------------------------------------
  container_names = coalesce(var.container_names, ["${var.teamid}${var.prjid}"])
  # -----------------------------------------------
  # DEFAULT BLOB NAME
  #- ----------------------------------------------
  blob_name               = var.blob_name != null ? var.blob_name : "${var.teamid}-${var.prjid}"
  container_name_for_blob = coalesce(var.container_name_for_blob, element(local.container_names, 0)) #join("", local.container_names))
}

# change to -> sha256(resourceGroupName+subscription_id)[:8])
resource "random_string" "string" {
  length  = 3
  special = false
  lower   = true
  upper   = false
}


