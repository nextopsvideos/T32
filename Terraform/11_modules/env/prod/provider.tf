terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.69.0"
    }
  }
  
 backend "azurerm" {
    access_key           = "asdfasdfasdfasdfasdfasdfasdfasdf"  
    storage_account_name = "storage01"                                
    container_name       = "tfstate"                                  
    key                  = "terraform.tfstate"                   
  }
}

provider "azurerm" {
  resource_provider_registrations = "none" 
  features {}
}