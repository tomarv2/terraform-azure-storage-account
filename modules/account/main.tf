module "global" {
  source = "git::git@tomarv2:tomarv2/terraform-global.git//common?ref=v0.0.1"
}

# change to -> sha256(resourceGroupName+subscription_id)[:8])
resource "random_string" "string" {
  length  = 3
  special = false
  lower   = true
  upper   = false
}
