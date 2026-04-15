data "azurerm_resource_group" "existingrg" {
  name = "NextOps"
}

data "azurerm_virtual_network" "existingvnet" {
  name = "NextOpsVNET01"
  resource_group_name = data.azurerm_resource_group.existingrg.name
}

data "azurerm_subnet" "existingsubnet" {
  name = "subnet1"
  resource_group_name = data.azurerm_resource_group.existingrg.name 
  virtual_network_name = data.azurerm_virtual_network.existingvnet.name
}

#The following block creates new resource in existing vnet
resource "azurerm_subnet" "newsubnet2" {
  name = "subnet2"
  address_prefixes = ["10.20.2.0/24"]
  resource_group_name = data.azurerm_resource_group.existingrg.name 
  virtual_network_name = data.azurerm_virtual_network.existingvnet.name  
}

resource "azurerm_subnet" "newsubnet3" {
  name = "subnet3"
  address_prefixes = ["10.20.3.0/24"]
  resource_group_name = data.azurerm_resource_group.existingrg.name 
  virtual_network_name = data.azurerm_virtual_network.existingvnet.name  
}