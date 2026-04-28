variable "rg_name" {
  type = string
  description = "To store actual value for resource group name"
}

variable "rg_location" {
  type = string
  description = "To store actual value for resource group location"
}

variable "acr_name" {
  type = string 
  description = "ACR Name"
}

variable "acr_sku" {
  type = string 
  description = "ACR SKU Ex: Basic, Standard, Premium"
}

variable "aks_name" {
  type = string
}

variable "aks_node_count" {
  type = string
}

variable "aks_node_size" {
  type = string
}

variable "aks_env" {
  type = string
}