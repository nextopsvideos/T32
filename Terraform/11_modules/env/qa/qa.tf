module "qa" {
  source        = "../../aks"
  rg_name       = "QARG"
  rg_location   = "centralus"
  acr_name      = "nextopsqaacrt32"
  acr_sku       = "Standard"
  aks_name      = "nextopsqaakst32"
  node_count    = 1
  env           = "qa"
}