resource "azurerm_container_registry" "default" {
  location            = var.location
  name                = local.dynamic_app_name
  resource_group_name = azurerm_resource_group.flixtube.name
  admin_enabled       = false
  sku                 = "Basic"
}

output "registry_name" {
  value = azurerm_container_registry.default.name
}

output "registry_hostname" {
  value = azurerm_container_registry.default.login_server
}
