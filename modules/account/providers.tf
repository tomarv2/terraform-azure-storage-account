terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azurerm = {
      version = "~> 2.98"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}
