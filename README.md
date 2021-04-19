```
locals {
  project_code = "ps1234"
}

resource "azurerm_resource_group" "project_group" {
  name     = "project_group"
  location = "UK South"
}

module "azure-virtual-network" {
  source  = "andrewCluey/vnet/azurerm"
  version = "x.x.x"

  name_prefix         = "vn"
  project_code        = local.project_code
  environment         = var.environment
  location            = "UK South"
  location_short      = "uks"
  resource_group_name = azurerm_resource_group.project_group.name
  vnet_cidr           = ["10.0.0.0/22"]
  dns_servers         = ["10.20.0.50", "10.20.0.51"]      # Not required if using Azure provided DNS.
}

```