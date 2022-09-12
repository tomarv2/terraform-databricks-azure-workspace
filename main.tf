data "azurerm_client_config" "current" {
}

data "external" "current_user" {
  program = ["az", "account", "show", "--query", "user"]
}

/*
data "databricks_current_user" "me" {
  depends_on = [azurerm_databricks_workspace.this]
}
*/

module "resource_group" {
  source = "git::git@github.com:tomarv2/terraform-azure-resource-group.git?ref=v0.0.12"

  resource_group_settings = var.resource_group_settings != null ? var.resource_group_settings : []

  teamid = var.teamid
  prjid  = var.prjid
}
