#One resource group
resource "azurerm_resource_group" "rg1" {
   name             = var.rg_name
  location          = var.rg_location
}

#One VNET
resource "azurerm_virtual_network" "vnet1" {
  name                  = var.vnet_name
  address_space         = var.address_space             #10.100.0.0/16
  resource_group_name   = azurerm_resource_group.rg1.name
  location              = azurerm_resource_group.rg1.location
}

#Multiple Subnets
resource "azurerm_subnet" "subnet" {
  count                 = length(var.subnet_name)   #== 4
  name                  = var.subnet_name[count.index]  #subnet_name[0] = subnet1, subnet_name[1] = subnet2, subnet_name[2] = subnet3, subnet_name[3] = subnet4
  resource_group_name   = azurerm_resource_group.rg1.name
  virtual_network_name  = azurerm_virtual_network.vnet1.name
  address_prefixes      = ["10.100.${count.index}.0/24"] #10.100.0.0/24, 10.100.1.0/24, 10.100.2.0/24, 10.100.3.0/24
}

#Multiple NIC cards
resource "azurerm_network_interface" "nic" {
  count                 = 4
  name                  = "nextopsnic-${count.index}" #nextopsnic-0, nextopsnic-1, nextopsnic-2, nextopsnic-3
  location              = azurerm_resource_group.rg1.location
  resource_group_name   = azurerm_resource_group.rg1.name 

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet[count.index].id
    private_ip_address_allocation = "Dynamic"
  }    
}

#Multiple VMs
resource "azurerm_linux_virtual_machine" "vm1" {
  count               = length(var.subnet_name) #4
  name                = "nextopsvm${count.index}" #nextopsvm0, nextopsvm1, nextopsvm2, #nextopsvm3
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  
  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    #ssh-keygen -t rsa -f C:\Class_Code\T32\Terraform\12_loops\count\SSH_Keys\id_rsa 
    public_key = file("C:/Class_Code/T32/Terraform/12_loops/count/SSH_Keys/id_rsa.pub")
  }

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