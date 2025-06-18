terraform {
    required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "1ecb1540-18db-4ab8-9eac-659a71d4a5f7"
}


