resource "azurerm_subnet" "moonrisesubnet" {
  name                 = var.subnet_name
  virtual_network_name =  var.vnet_name
  resource_group_name  =  var.rg_name
  address_prefixes     = var.address_prefixes

}