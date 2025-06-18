resource "azurerm_virtual_network" "sunrisevnet" {
  name                =  var.vnet_name
  location            = var.vnet_location
  resource_group_name = var.rg_name
  address_space       = var.address_space
}