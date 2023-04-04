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

module "blob" {
  source = "../../modules/blob"
  blobs_config = {
    demo_blob = {
      storage_account_name   = "<storage_account_name>"
      storage_container_name = "test2"
      type                   = "test2-blob"
      source                 = "/tmp/<sample_file>"
    }
  }
}
