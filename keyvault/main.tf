resource "azurerm_key_vault" "moonrisekv001" {
  name                        = var.kv_name
  location                    = var.location
  resource_group_name         = var.rg_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = false
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_access_policy" "vm_access_policy" {
  key_vault_id = azurerm_key_vault.moonrisekv001.id  # <-- ye aapke existing key vault ka resource name hoga
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get",
    "Set",
    "List",
    "Delete"
  ]
}


resource "azurerm_key_vault_secret" "frontendvm-username" {
  name         = "frontendvm-username"
  value        = var.vmusername1
  key_vault_id = resource.azurerm_key_vault.moonrisekv001.id
}

resource "azurerm_key_vault_secret" "frontendvm-password" {
  name         = "frontendvm-password"
  value        = var.vmpassword1
  key_vault_id = resource.azurerm_key_vault.moonrisekv001.id
}
resource "azurerm_key_vault_secret" "backendvm-username" {
  name         = "backendvm-username"
  value        = var.vmusername2
  key_vault_id = resource.azurerm_key_vault.moonrisekv001.id
}
resource "azurerm_key_vault_secret" "backendvm-password" {
  name         = "backendvm-password"
  value        = var.vmpassword2
  key_vault_id = resource.azurerm_key_vault.moonrisekv001.id
}
