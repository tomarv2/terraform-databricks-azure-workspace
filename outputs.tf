output "databricks_host" {
  description = "databricks workspace url"
  value       = "https://${azurerm_databricks_workspace.this.workspace_url}/"
}

output "resource_group_name" {
  description = "databricks resource group name"
  value       = azurerm_databricks_workspace.this.resource_group_name
}

output "managed_resource_group_name" {
  description = "databricks managed resource group name"
  value       = azurerm_databricks_workspace.this.managed_resource_group_name
}

output "databricks_workspace_id" {
  description = "databricks workspace id"
  value       = azurerm_databricks_workspace.this.workspace_id
}
