# resource "terraform_resource_type" "codeblock_ref" {
#     key1 = "value1"
#     key2 = "value2"
# }

resource "azurerm_resource_group" "rg1" {
  name      = "NextOpsRGT32"  
  location  = "eastus"
  tags = { 
    "env" = "dev" 
    }
}

resource "azurerm_virtual_network" "vnet1" {
  name                  = "NextOpsVNETT32"
  location              = azurerm_resource_group.rg1.location
  resource_group_name   = azurerm_resource_group.rg1.name #== NextOpsRGTT32
  address_space         = ["10.10.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_network_interface" "nic1" {
  name                = "nextopsvmt32-nic"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm1" {
  name                = "nextopsvmt32"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "P2ssw0rd@123"
  disable_password_authentication = false #Username/password
  network_interface_ids = [
    azurerm_network_interface.nic1.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}