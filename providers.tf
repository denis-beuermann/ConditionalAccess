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
   tenant_id = "85267153-8057-47e2-8a1c-09cdbabb1877"
   client_id = "d6ea5a29-28c8-4451-8497-695886d95ea8"
}
