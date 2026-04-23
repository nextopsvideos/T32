module "dev" {
    source        = "../../aks"
    rg_name       = "DevRG"
    rg_location   = "eastus"
    acr_name      = "nextopsdevacrt32"
    acr_sku       = "Basic"
    aks_name      = "nextopsdevakst32"
    node_count    = 1
    env           = "dev"
}