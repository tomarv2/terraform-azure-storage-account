locals {
  stg_account_name       = coalesce(var.storage_account_name, "${var.teamid}${var.prjid}")
  clean_stg_account      = substr(replace(local.stg_account_name, "-", ""), 0, 20)
  clean_stg_account_name = format("%s%s", local.clean_stg_account, tostring(random_string.string.result))
}

# change to -> sha256(resourceGroupName+subscription_id)[:8])
resource "random_string" "string" {
  length  = 3
  special = false
  lower   = true
  upper   = false
}

//resource "null_resource" "resource_group_setup" {
//  # Resource Group creation is eventually consistent, so add a delay.
//    provisioner "local-exec" {
//    command = <<EOT
//      echo "sleeping for 30 seconds...";
//      sleep 30;
//      echo "completing sleep";
//      finished=false
//      while ! $finished; do
//          az group exists -n ${var.rg_name}
//          finished=true
//      done;
//    EOT
//    }
//}
