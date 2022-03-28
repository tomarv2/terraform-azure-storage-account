terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azurerm = {
      version = "~> 2.98"
    }
  }
}

provider "azurerm" {
  features {}
}

module "blob" {
  source = "../../modules/blob"

  storage_account_name   = "<storage_account_name>"
  storage_container_name = "test2"
  blob_name              = "test2-blob"
  blob_source            = "/tmp/<sample_file>"
}
