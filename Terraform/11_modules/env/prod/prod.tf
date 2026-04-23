module "prod" {
  source        = "../../aks"
  rg_name       = "ProdRG"
  rg_location   = "westus"
  acr_name      = "nextopsprdacrt32"
  acr_sku       = "Premium"
  aks_name      = "nextopsprdakst32"
  node_count    = 1
  env           = "prod"
}