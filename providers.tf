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

provider "azuread" {
   alias = "sandbox"
   tenant_id = "85267153-8057-47e2-8a1c-09cdbabb1877"
   client_id = "d6ea5a29-28c8-4451-8497-695886d95ea8"
}

provider "azurerm" {
  features {}
  alias = "personal"
  tenant_id = "c971bc41-11de-4927-a27e-20c7d52b6d87"
  client_id = "5c1cf452-b73c-48d3-8032-e808d6d77ee8"
}