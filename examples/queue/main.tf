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

module "queue" {
  source = "../../modules/queue"

  queues_config = {
    demo_queue_name = {
      storage_account_name = "<demo_storage_account_name>"
    }
  }
}
