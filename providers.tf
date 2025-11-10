terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "~> 4.16.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
   features {}
   subscription_id = "bb7d8567-c068-485b-8f96-6012d56fff0c"
}
