terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azurerm = {
      version = "~> 3.21.1"
    }
  }
}

provider "azurerm" {
  features {}
}

module "container" {
  source = "../../modules/container"

  storage_containers_config = {
    c7n-aci-logs = {
      storage_account_name = "<storage_account_name>"
      container_access_type = "private"
    }
    c7n-aci-policies = {
      storage_account_name = "<storage_account_name>"
      container_access_type = "private"
    }
  }

  teamid               = var.teamid
  prjid                = var.prjid
}
