terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.69.0"
    }
  }
  
  backend "azurerm" {
    access_key           = "1iEN3QBbPmNqL9Paw4QKVk0eoel4zD6o/QurE5t+MnUUSHicWHJSibsidYfWmVoCy5fTRP390ZXW+AStO9IbqQ=="  
    storage_account_name = "nextopssat32"                                
    container_name       = "tfstate"                                  
    key                  = "terraform.tfstate"                   
  }

}

provider "azurerm" {
  resource_provider_registrations = "none" 
  features {}
}