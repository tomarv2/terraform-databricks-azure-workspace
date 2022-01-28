data "azurerm_client_config" "current" {
}

data "external" "current_user" {
  program = ["az", "account", "show", "--query", "user"]
}
