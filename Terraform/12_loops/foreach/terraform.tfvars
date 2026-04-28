resource_details = {
  "eastus" = {
    rg_name         = "eastRG"
    rg_location     = "eastus"
    vnet_name       = "eastVNET"
    address_space   = ["10.10.0.0/16"]
    subnet_name     = "eastsubnet"
    address_prefix  = ["10.10.0.0/24"]
    nic_name        = "eastvmnic"
    vm_name         = "eastvm01"
    vm_size         = "Standard_B1s"
  }
  "westus" = {
    rg_name         = "westRG"
    rg_location     = "westus"
    vnet_name       = "westVNET"
    address_space   = ["10.20.0.0/16"]
    subnet_name     = "westsubnet"
    address_prefix  = ["10.20.0.0/24"]
    nic_name        = "westvmnic"
    vm_name         = "westvm01"
    vm_size         = "Standard_B2s"
  }
}