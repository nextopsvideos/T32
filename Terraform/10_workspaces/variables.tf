variable "rg_name" {
    type = string  
}

variable "rg_location" {
    type = string  
}

variable "vnet_name" {
    type = string  
}

variable "vnet_addressspace" {
    type = list(string)
}

variable "subnet_name" {
    type = string  
}

variable "subnet1_addressprefix" {
    type = list(string)
}

variable "subnet2_name" {
    type = string  
}

variable "subnet2_addressprefix" {
    type = list(string)
}