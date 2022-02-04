resource "databricks_token" "pat" {
  provider = databricks.created_workspace

  comment          = "Terraform managed: ${var.teamid}-${var.prjid}"
  lifetime_seconds = var.databricks_token_lifetime_seconds
}

provider "databricks" {
  alias = "created_workspace"
  host  = azurerm_databricks_workspace.this.workspace_url
}
