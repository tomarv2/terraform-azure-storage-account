terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azurerm = {
      version = "~> 3.21.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}
