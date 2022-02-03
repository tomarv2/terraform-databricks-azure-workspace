resource "azurerm_databricks_workspace" "this" {
  name                        = var.workspace_name != null ? var.workspace_name : "${var.teamid}-${var.prjid}"
  resource_group_name         = azurerm_resource_group.this.name
  location                    = azurerm_resource_group.this.location
  sku                         = var.sku
  managed_resource_group_name = "${local.prefix}-workspace-rg"
  tags                        = local.shared_tags
}
