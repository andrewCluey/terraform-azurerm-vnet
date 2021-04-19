output "vnet_id" {
  description = "The ID of the newly created vNet."
  value       = azurerm_virtual_network.main_vnet.id
}

output "vnet_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.main_vnet.name
}

output "vnet_address_space" {
  description = "Tghe address space if the new vNET."
  value       = azurerm_virtual_network.main_vnet.address_space
}