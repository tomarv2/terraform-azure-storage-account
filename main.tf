provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version               = "~> 2.21"
  features {}

  subscription_id       = var.subscription_id
  client_id             = var.client_id
  client_secret         = var.client_secret
  tenant_id             = var.tenant_id
}

terraform {
  required_version      = ">= 0.12"
}

locals {
  shared_tags = map(
      "Name", "${var.teamid}-${var.prjid}",
      "Owner", var.email,
      "Team", var.teamid,
      "Project", var.prjid
  )
}