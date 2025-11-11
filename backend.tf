terraform {
   backend "azurerm" {
    use_azuread_auth = true
    tenant_id = "c971bc41-11de-4927-a27e-20c7d52b6d87"
    subscription_id         = "bb7d8567-c068-485b-8f96-6012d56fff0c"
    client_id = "5c1cf452-b73c-48d3-8032-e808d6d77ee8"
    resource_group_name = "rg-tfstae-gwc-prd"
    storage_account_name = "sttfstategwcprd"
    container_name = "state"
    key = "terraform.tfstate"
   }
}