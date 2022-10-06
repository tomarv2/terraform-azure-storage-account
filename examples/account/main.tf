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

module "account" {
  source = "../../modules/account"

  storage_accounts_config = {
    "securitydevsecuritybv8t" = {
      resource_group  = "cloud-custodian"
      location        = "westus2"
      min_tls_version = "TLS1_0"
    }
  }
  teamid = var.teamid
  prjid  = var.prjid
}
