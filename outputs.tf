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

output "databricks_sku" {
  description = "The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial. Changing this can force a new resource to be created in some circumstances"
  value       = azurerm_databricks_workspace.this.sku
}

output "databricks_token" {
  description = "Value of the newly-created token"
  value       = databricks_token.pat.token_value
  sensitive   = true
}

output "nonsensitive_databricks_token" {
  description = "Value of the newly-created token"
  value       = nonsensitive(databricks_token.pat.token_value)
}

output "databricks_token_lifetime_hours" {
  description = "Token validity"
  value       = databricks_token.pat.lifetime_seconds / 3600
}
