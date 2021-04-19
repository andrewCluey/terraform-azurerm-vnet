locals {
  name_prefix = var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0-9]$/", "$0-") : ""
  vnet_name   = lower("${local.name_prefix}-${var.project_code}-${var.location_short}-${var.environment}")
  module_tag = {
    "module" = basename(abspath(path.module))
  }
  default_tags = {
    environment = var.environment
    project     = var.project_code
  }

  tags = merge(var.tags, local.module_tag, local.default_tags)
}


resource "azurerm_virtual_network" "main_vnet" {
  name                = local.vnet_name
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_cidr
  location            = var.location
  dns_servers         = var.dns_servers
  tags                = local.tags
}


