resource "azurerm_public_ip" "moonrisepip" {
  name                = var.public_ip_name
  location            = var.public_ip_location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}
