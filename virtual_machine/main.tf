data "azurerm_key_vault" "moonrisekv001" {
  name                = "moonrise-kv003"
  resource_group_name = "moonrise-rg"
}
data "azurerm_key_vault_access_policy" "vm_access_policy" {
  name = "Key Management"
}
data "azurerm_key_vault_secret" "frontendvm-username" {
  name         = "frontendvm-username"
  key_vault_id = data.azurerm_key_vault.moonrisekv001.id
}
data "azurerm_key_vault_secret" "frontendvm-password" {
  name         = "frontendvm-password"
  key_vault_id = data.azurerm_key_vault.moonrisekv001.id
}
data "azurerm_key_vault_secret" "backendvm-username" {
  name         = "backendvm-username"
  key_vault_id = data.azurerm_key_vault.moonrisekv001.id
}
data "azurerm_key_vault_secret" "backendvm-password" {
  name         = "backendvm-password"
  key_vault_id = data.azurerm_key_vault.moonrisekv001.id
}




data "azurerm_subnet" "moonrisesubnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_public_ip" "moonrisepip" {
  name                = var.pip_name
  resource_group_name = var.rg_name
}

resource "azurerm_network_interface" "moonrisenic" {
  name                = var.nic_name
  location            = var.nic_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.moonrisesubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.moonrisepip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm-fronted" {
  name                = var.virtual_machine
  resource_group_name = var.rg_name
  location            = var.virtual_machine_location
  size                = "Standard_B1s"
  admin_username      = data.azurerm_key_vault_secret.frontendvm-username.value
  admin_password      = data.azurerm_key_vault_secret.frontendvm-password.value
  disable_password_authentication = false
  network_interface_ids = [
    resource.azurerm_network_interface.moonrisenic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}