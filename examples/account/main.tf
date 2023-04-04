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
    "demostorageaccount" = {
      resource_group  = "<resource_group_name>"
      location        = "westus2"
      min_tls_version = "TLS1_0"
    }
  }
}
