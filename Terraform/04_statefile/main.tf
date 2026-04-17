#Desired infrastructure
resource "azurerm_resource_group" "rg1" {
  name      = "NextOpsRGT32"
  location  = "westus"
  tags = { "env" = "dev" } 
}

resource "azurerm_service_plan" "asp1" {
  name                = "nextopsaspt32"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  os_type             = "Linux"
  sku_name            = "S2"
}

resource "azurerm_linux_web_app" "app1" {
  name                = "nextopswat32"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_service_plan.asp1.location
  service_plan_id     = azurerm_service_plan.asp1.id

  site_config {}
}
