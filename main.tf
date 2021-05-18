# Minimum azure provider to use
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.54.0"
    }
  }
}


locals {
  module_tag = {
    "module" = basename(abspath(path.module))
  }

  tags = merge(var.tags, local.module_tag)
}

resource "azurerm_virtual_network" "main_vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_cidr
  location            = var.location
  dns_servers         = var.dns_servers
  tags                = local.tags
}


