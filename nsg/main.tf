resource "azurerm_network_security_group" "moonrise" {
  name                = var.nsg_name
  location            = var.nsg_location
  resource_group_name =  var.rg_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = var.destination_port
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
data "azurerm_network_interface" "moonrisenic" {
  name                = var.nic_name
  resource_group_name = var.rg_name
}


resource "azurerm_network_interface_security_group_association" "moonrisensga" {
  network_interface_id      = data.azurerm_network_interface.moonrisenic.id
  network_security_group_id = azurerm_network_security_group.moonrise.id
}