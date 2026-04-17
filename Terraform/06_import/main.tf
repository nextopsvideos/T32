resource "azurerm_resource_group" "rg1" {
  name      = "NextOpsRGT33"  
  location  = "eastus"
  tags = { 
    "env" = "prod" 
    }
}

resource "azurerm_virtual_network" "vnet1" {
  name                  = "NextOpsVNETT33"
  location              = azurerm_resource_group.rg1.location
  resource_group_name   = azurerm_resource_group.rg1.name #== NextOpsRGTT33
  address_space         = ["10.20.0.0/16"]
  tags = { 
    "env" = "prod" 
    }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.20.0.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.20.1.0/24"]
}

resource "azurerm_subnet" "subnet3" {
  name                 = "subnet3"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.20.2.0/24"]
}