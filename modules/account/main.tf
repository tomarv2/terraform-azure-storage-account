# change to -> sha256(resourceGroupName+subscription_id)[:8])
resource "random_string" "string" {
  length  = 3
  special = false
  lower   = true
  upper   = false
}
